;; Check system-type, and if its mac
(setq is-mac (equal system-type 'darwin))
(when is-mac
  (use-package exec-path-from-shell
    :ensure t
    :config
    (setq-default mac-option-modifier
		  '(:ordinary meta :function meta :mouse meta))
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

;; Set GC-threshold
;; See https://anuragpeshne.github.io/essays/emacsSpeed.html
(setq gc-cons-threshold 100000000)

;; Enable line number
(add-hook 'emacs-startup-hook 'global-linum-mode)

;; Auto Completion
;; Using company mode for all the mode
(use-package company
  :ensure t
  :pin melpa-stable
  :bind*
  ;; Invoke the next company backend, so that another backend candidates can be
  ;; generated, see http://company-mode.github.io/manual/Backends.html#Backends
  ("C-c C-o" . 'company-other-backend)
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;; General Company Frontend Configs (tooltip config)
  ;; Wrap the tooltip, i.e. next of last items is the first one
  (setq company-selection-wrap-around t)
  ;; Flip the tooltip, i.e. list the candidates starting the near point
  (setq company-tooltip-flip-when-above t))

;; Ido-mode
;; Used to improve the experience for finding files
(use-package ido
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'after-init-hook 'ido-mode))

;; Automatically save compilation
(setq compilation-ask-about-save nil)

;; Turn on yasnippet
(use-package yasnippet
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'after-init-hook 'yas-global-mode))

;; Install magit if not installed
(use-package magit
  :ensure t
  :pin melpa-stable
  :bind* ("C-x g" . magit-status))

(require 'init-windows)
(require 'init-sidebar)

(require 'init-markdown)

(provide 'init-basic)
