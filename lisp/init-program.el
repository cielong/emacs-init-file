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

(provide 'init-program)
