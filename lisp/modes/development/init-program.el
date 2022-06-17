;; Set indent guide
(use-package indent-guide
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'indent-guide-mode)
  :config
  (setq indent-guide-recursive t)
  (setq indent-tabs-mode nil))

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-layout-mode)

;; Highlight 80 column using whitespace mode
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-style '(face empty lines-tail trailing))
  (global-whitespace-mode t)
  )

;; Auto completion
(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t)
  (ac-set-trigger-key "TAB"))

;; Dump Jump for code-navigation
(use-package ivy
  :ensure t)
(use-package dumb-jump
  :bind (("C-c o" . dumb-jump-go-other-window)
         ("C-c j" . dumb-jump-go)
         ("C-c b" . dumb-jump-back)
         ("C-c i" . dumb-jump-go-prompt)
         ("C-c x" . dumb-jump-go-prefer-external)
         ("C-c z" . dumb-jump-go-prefer-external-other-window))
  :after (ivy)
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure t
  )

(provide 'init-program)
