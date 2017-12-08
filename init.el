(package-initialize)

;; Toggling of menu-bar, tool-bar, scoll-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scoll-bar-mode) (scorll-bar-mode -1))

;; No startup screen
(setq inhibit-startup-message t)

;; Set up load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Set appearance 
(require 'init-appearance)

;; Set up packages repo
(require 'init-elpa)

;; Basic Customization
;;   * Check Operating System (Remap key)
;;   * Set Global Mode
;;   * Set Path of global program
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
(pdf-tools-install)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

;;    Shell file (zsh-theme)
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . sh-mode))

;; Language Specific setup files
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'julia-mode '(require 'init-julia))
(eval-after-load 'python '(require 'init-python))
(eval-after-load 'java '(require 'init-java))
(put 'set-goal-column 'disabled nil)
