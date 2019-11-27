;; Remap `set mark` command to C-c m
(global-set-key (kbd "C-c m") 'set-mark-command)

;; Kill region
(global-set-key (kbd "C-c k") 'kill-region)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Magit-Status
(global-set-key (kbd "C-x g") 'magit-status)

;; string inflection
(require 'string-inflection)
(global-set-key (kbd "C-c u") 'string-inflection-all-cycle)

(provide 'key-bind-setting)
