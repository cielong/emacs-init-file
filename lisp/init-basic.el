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

;; Auto Completion
;; Using company mode for all the mode
(use-package company
  :ensure t
  :pin melpa-stable
  :bind
  ;; Invoke the next company backend, so that another backend candidates can be
  ;; generated, see http://company-mode.github.io/manual/Backends.html#Backends
  ("C-c C-/" . 'company-other-backend)
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
  :pin melpa-stable)

;; Install projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(require 'init-windows)
(require 'init-sidebar)

(provide 'init-basic)
