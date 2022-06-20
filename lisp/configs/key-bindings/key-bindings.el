;; Use `bind-key' provided by `use-package' to globally bind a key
;; This helps to avoid other modes override this key
;; See https://github.com/jwiegley/use-package/blob/a7422fb8ab1baee19adb2717b5b47b9c3812a84c/bind-key.el#L50
(require 'bind-key)

;; Remap `set mark` command to C-c m
(bind-key* "C-c m" 'set-mark-command)

;; Kill region
(bind-key* "C-c k" 'kill-region)

;; Perform general cleanup.
(bind-key* "C-c n" 'cleanup-buffer)

(provide 'key-bindings)
