;; Remap `set mark` command to C-c m
(global-set-key (kbd "C-c m") 'set-mark-command)

;; Kill region
(global-set-key (kbd "C-c k") 'kill-region)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(provide 'key-bindings)
