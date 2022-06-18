;; Toggling of menu-bar, tool-bar, scoll-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scoll-bar-mode) (scorll-bar-mode -1))

;; No startup screen
(setq inhibit-startup-message t)

;; Set appearance
(require 'init-theme)

;; Basic Customization
;;   * Check Operating System (Remap key)
;;   * Set Global Mode
;;   * Set Path of global program
;;   * Set Backup directory
(require 'init-basic)
(require 'key-bindings)

;; Load extra files
;; Keep emacs customization in different file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load extra local settings
(setq local-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p local-file)
  (load local-file))

;; ------------------------
;; Set up file extensions
;; ------------------------

;;    GIT commit
(add-to-list 'auto-mode-alist '("\\.git\\/COMMIT_EDITMSG\\'" . (lambda()
				(require 'init-git-commit))))

;;    Markdown file
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))

;;    Shell file (zsh-theme)
(add-to-list 'auto-mode-alist '("\\.sh\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . shell-script-mode))

;; -----------------------------
;; Language Specific setup files
;; -----------------------------
(eval-after-load 'emacs-lisp-mode (require 'init-lisp))
(eval-after-load 'sh-mode (require 'init-shell))
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'python '(require 'init-python))
