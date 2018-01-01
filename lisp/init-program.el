;; Set indent guide
(require 'indent-guide)
(setq indent-guide-recursive t)
(setq indent-tabs-mode nil)

(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-layout-mode)

;; Highlight 80 column using whitespace mode
(require 'whitespace)
(require 'column-marker)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))

(require 'auto-complete)
(ac-set-trigger-key "TAB")

(provide 'init-program)
