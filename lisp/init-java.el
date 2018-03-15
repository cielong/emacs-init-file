(require 'init-program)
(require 'eclim)
(require 'company-emacs-eclim)

(setq eclimd-autostart t)

(defun my-eclim-mode-hook ()
    (eclim-mode t))
(add-hook 'java-mode-hook 'my-eclim-mode-hook)

(company-emacs-eclim-setup)
(global-company-mode t)

;; Show error messages in the code buffer
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(defun my-return-p (input)
  (eq . (string-to-char input)))

(setq company-auto-complete-chars #'my-return-p)

;; Customize tab
(defun tab-customization ()
  (setq indent-tabs-mode nil)
  (setq tab-stop-list (number-sequence 8 200 8))
  (setq tab-width 8)
  (setq indent-line-function 'insert-tab))
(add-hook 'cc-mode-hook 'tab-customization)

(provide 'init-java)
