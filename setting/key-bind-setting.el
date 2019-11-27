(require 'use-package)

;; Remap `set mark` command to C-c m
(global-set-key (kbd "C-c m") 'set-mark-command)

;; Kill region
(global-set-key (kbd "C-c k") 'kill-region)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Magit-Status
(global-set-key (kbd "C-x g") 'magit-status)

;; string inflection
(use-package string-inflection
  :commands (string-inflection-all-cycle)
  :bind (("C-c u" . string-inflection-all-cycle))
  :ensure t)

(provide 'key-bind-setting)
