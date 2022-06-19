(require 'init-program)

;; Custom company-backends for emacs lisp
(defun company-lisp ()
  "Company backends enabled in lisp mode:
   - `company-capf' with `company-yasnippet'
   - `company-files'
  "
  (setq-local company-backends
              '((company-capf
                 :with company-yasnippet
                 :separate)
                company-files))
  )
(add-hook 'emacs-lisp-mode-hook 'company-lisp)

(provide 'init-lisp)
