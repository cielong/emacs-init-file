;; Check system-type, and if its mac
(setq is-mac (equal system-type 'darwin))
(when is-mac
  (use-package exec-path-from-shell
    :ensure t
    :config
      (exec-path-from-shell-initialize)
    ))

;; Set Back-up directory & version control on all platform
(setq
 backup-by-copying t
 backup-directory-alist'(("." . ".~"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; Using company mode for all the mode
(setq ispell-program-name "/usr/local/bin/ispell")
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(use-package ido
  :ensure t
  :init
  (add-hook 'after-init-hook 'ido-mode))

;; Automatically save compilation
(setq compilation-ask-about-save nil)

;; Turn on set goal column mode
(put 'set-goal-column 'disabled nil)

;; Turn on yasnippet
(use-package yasnippet
  :ensure t
  :init
  (add-hook 'after-init-hook 'yas-global-mode))

;; Turn on dired-omit-mode
;; Reset dired-omit-fiels to only files begin with '.'
;; excluding special directory '.' and '..'
(use-package dired-x
  :ensure nil
  :config
  (setq-default dired-omit-files-p t) ; Buffer-local variable
  (setq dired-omit-files "^\\.[^.]+$"))

;; Load extra file pattern that wants to be omitted
(defcustom dired-omit-files-config "~/.emacs.d/.dired-omit-files"
  "The file path of the config which specifies all the extra regexp file
patterns to be omitted"
  :type 'string
  :group 'dired-x
  )

(defun set-dired-omit-files ()
  "Set dired omit files to omit all the hidden files including patterns defined
in 'dired-omit-files-config' and excluding '.' & '..'"
  (setq dired-omit-files "^\\.[^.]+$")
  (when (file-exists-p dired-omit-files-config)
    (progn
      (with-temp-buffer
	(insert-file-contents dired-omit-files-config)
        (mapcar (lambda (file-pattern)
		  (setq dired-omit-files (concat dired-omit-files "\\|"))
		  (setq dired-omit-files (concat dired-omit-files file-pattern)))
		(split-string (buffer-string) "\n" t))))))

(defun reset-dired-omit-files ()
  "Reset dired omit files to not omit anything."
  (setq dired-omit-files "^$"))

(defun toggle-omit-files ()
  "Show/hide hidden files"
  (interactive)
  (if (string= dired-omit-files "^$")
    (set-dired-omit-files)
    (reset-dired-omit-files))
  (revert-buffer))

;; Sort directory first in dired
(use-package ls-lisp
  :ensure nil
  :config
  (setq ls-lisp-dirs-first t)
  (setq ls-lisp-use-insert-directory-program nil))

;; Toggle dired-sidebar
(use-package dired-sidebar
  :bind (("C-c C-f" . dired-sidebar-toggle-sidebar)
	 ((:map dired-sidebar-mode-map) ("C-c C-t" . toggle-omit-files)))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
	    'set-dired-omit-files)
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'ascii)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

;; Toggle ibuffer-sidebar by default
(use-package ibuffer-sidebar
  :bind (("C-c C-b" . ibuffer-sidebar-toggle-sidebar))
  :ensure t
  :commands (ibuffer-sidebar-toggle-sidebar)
  :config
  (setq ibuffer-sidebar-use-custom-font t)
  (setq ibuffer-sidebar-face `(:family "Helvetica" :height 140)))

(provide 'init-basic)
