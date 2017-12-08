;; Check system-type, and if its mac 
(setq is-mac (equal system-type 'darwin))
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  ;; Remap Set mark command to C-c m
  (global-set-key (kbd "C-c m") 'set-mark-command))

;; Using company mode for all the mode
(setq ispell-program-name "/usr/local/bin/ispell")
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'ido-mode)

;; Automatically save compilation
(setq compilation-ask-about-save nil)

(provide 'init-basic)
