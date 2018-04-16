(require 'init-program)

(elpy-enable)

;; Enable flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Using autopep8 as reference
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Virtual Env enabled
(setenv "WORKON_HOME" "/Users/cielo/anaconda/envs")
(pyvenv-mode 1)

;; Customize tab
(defun tab-customization ()
  (setq tab-stop-list (number-sequence 4 200 4))
  (setq tab-width 4)
  (setq indent-line-function 'insert-tab))
(add-hook 'python-mode-hook 'tab-customization)

(provide 'init-python)
