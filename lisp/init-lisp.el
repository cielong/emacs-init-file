;; Set indent guide
(require 'indent-guide)
(setq indent-guide-recursive t)
(setq indent-tabs-mode nil)

(add-hook 'emacs-lisp-mode-hook 'indent-guide-mode)
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'electric-pair-mode)
(add-hook 'emacs-lisp-mode-hook 'electric-layout-mode)
(global-auto-complete-mode t)

;; Highlight 80 column using whitespace mode
(require 'whitespace)
(require 'column-marker)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
(add-hook 'emacs-lisp-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Auto completion
(require 'auto-complete)
(ac-set-trigger-key "TAB")

;; Dump Jump for code-navigation
(use-package dumb-jump
  :bind (("C-c o" . dumb-jump-go-other-window)
         ("C-c j" . dumb-jump-go)
         ("C-c b" . dumb-jump-back)
         ("C-c i" . dumb-jump-go-prompt)
         ("C-c x" . dumb-jump-go-prefer-external)
         ("C-c z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure t
  )

(provide 'init-lisp)
