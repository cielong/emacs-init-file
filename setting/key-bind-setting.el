;; Remap Set mark command to C-c m
(global-set-key (kbd "C-c m") 'set-mark-command)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Magit-Status
(global-set-key (kbd "C-x g") 'magit-status)
(provide 'key-bind-setting)
