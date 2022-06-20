;; Enhance project managements in Emacs through projectile and treemacs
;; Support:
;;   * Sidebar-view project view

;; Install projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (projectile-mode +1))

;; Use treemacs and projectile to manage projects
(use-package treemacs
  :ensure t
  :defer t
  :bind
  ("C-c C-f" . treemacs-display-current-project-exclusively)
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-hide-gitignored-files-mode t)

  (setq-default treemacs-show-hidden-files nil)
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
  :pin melpa-stable)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; ;; Toggle ibuffer-sidebar by default
;; (use-package ibuffer-sidebar
;;   :bind (("C-c C-b" . ibuffer-sidebar-toggle-sidebar))
;;   :ensure t
;;   :commands (ibuffer-sidebar-toggle-sidebar)
;;   :config
;;   (setq ibuffer-sidebar-use-custom-font t)
;;   (setq ibuffer-sidebar-face `(:family "Helvetica" :height 140)))

(provide 'init-sidebar)
