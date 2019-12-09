;; Toggling of menu-bar, tool-bar, scoll-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scoll-bar-mode) (scorll-bar-mode -1))

;; No startup screen
(setq inhibit-startup-message t)

;; Set up load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Set up packages repo
(require 'init-elpa)

;; Set appearance
(require 'init-appearance)

;; Set up & Load self-defined funciton file
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(if (file-exists-p defuns-dir)
  (dolist (file (directory-files defuns-dir t "\\w+"))
    (when (file-regular-p file)
      (load file)))
  (make-directory defuns-dir))

;; Set up setting file
(setq settings-dir (expand-file-name "setting" user-emacs-directory))
(if (file-exists-p settings-dir)
  (dolist (file (directory-files settings-dir t "\\w+"))
    (when (file-regular-p file)
      (load file)))
  (make-directory settings-dir))

;; Set up macro file
(setq macro-dir (expand-file-name "macros" user-emacs-directory))
(if (file-exists-p macro-dir)
  (dolist (file (directory-files macro-dir t "\\w+"))
    (when (file-regular-p file)
      (load file)))
  (make-directory macro-dir))

;; Basic Customization
;;   * Check Operating System (Remap key)
;;   * Set Global Mode
;;   * Set Path of global program
;;   * Set Backup directory
(require 'init-basic)

;; Keep emacs customization in different file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Set up file extensions
;;    Markdown file
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))

;;    Pdf file
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

;;    Shell file (zsh-theme)
(add-to-list 'auto-mode-alist '("\\.sh\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . shell-script-mode))

;;    Web development
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Language Specific setup files
(eval-after-load 'emacs-lisp-mode (require 'init-lisp))
(eval-after-load 'sh-mode (require 'init-shell))
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'julia-mode '(require 'init-julia))
(eval-after-load 'web-mode '(require 'init-web))
(eval-after-load 'js2-mode '(require 'init-javascript))
(eval-after-load 'cc-mode '(require 'init-java))
(eval-after-load 'python '(require 'init-python))
