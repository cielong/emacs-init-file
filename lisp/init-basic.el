;; Check system-type, and if its mac 
(setq is-mac (equal system-type 'darwin))
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  ;; Set Back-up directory & version control
  (setq
   backup-by-copying t 
   backup-directory-alist
    '(("." . ".~")) 
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t))

;; Using company mode for all the mode
(setq ispell-program-name "/usr/local/bin/ispell")
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'ido-mode)

;; Automatically save compilation
(setq compilation-ask-about-save nil)

;; Turn on set goal column mode
(put 'set-goal-column 'disabled nil)

(provide 'init-basic)
