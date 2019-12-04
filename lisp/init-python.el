(require 'init-program)

(use-package python
  :config
  (unbind-key "C-c C-f" python-mode-map)
)

(use-package elpy
  :ensure t
  :config
  (unbind-key "C-c C-f" elpy-mode-map)
  (unbind-key "C-c C-b" elpy-mode-map)
  :init
  (advice-add 'python-mode :before 'elpy-enable)
)

;; Enable flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Using autopep8 as reference
(use-package py-autopep8
  :ensure t
  :commands (py-autopep8-enable-on-save)
  :init
  (add-hook 'elpy-mode 'py-autopep8-enable-on-save)
)

;; Virtual Env enabled (pipenv)
;; (setenv "WORKON_HOME" "/Users/cielo/anaconda/envs")
;; (pyvenv-mode 1)
(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; Customize tab
(defun tab-customization ()
  (setq tab-stop-list (number-sequence 4 200 4))
  (setq tab-width 4)
  (setq indent-line-function 'insert-tab))
(add-hook 'python-mode-hook 'tab-customization)

(provide 'init-python)
