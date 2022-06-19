(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :mode ("README\\.md\\'" . gfm-mode)
  )

(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'indent-guide-mode)

;; Auto-completion
;; Custom company-backends for emacs lisp
(defun company-markdown ()
  "Company backends enabled in lisp mode:
   - `company-capf' with `company-yasnippet' and `compand-ispell'
   - `company-files'
  "
  (setq-local company-backends
              '((company-capf
                 :with company-yasnippet company-ispell
                 :separate)
                company-files))
  )
(add-hook 'markdown-mode-hook 'company-markdown)

;; Use flyspell to check spelling error if ispell is available
(if (executable-find "ispell")
  (use-package flyspell
  :ensure t
  :pin melpa-stable
  :hook text-mode)
  (message "Disable flyspell because executable `ispell' not found."))

;; Use pandoc to lively render Markdown if pandoc is available
(if (executable-find "pandoc")
    (use-package pandoc-mode
      :ensure t
      :pin melpa-stable
      :hook markdown-mode
      :config
      (setq markdown-command
            (format
             "%s -s --mathjax --meta pagetile='live-preview'"
             (executable-find "pandoc")))
      (setq markdown-enable-math t))
  (message "Disable pandoc-mode because executable `pandoc' not found"))

;; Update timestamp in the buffer
(add-hook 'before-save-hook 'time-stamp)

(provide 'init-markdown)
