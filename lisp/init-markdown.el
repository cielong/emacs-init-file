(flyspell-mode 1)
(setq markdown-command "/usr/local/bin/pandoc -s --mathjax")
(setq markdown-enable-math t)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'markdown-mode-hook flyspell-mode)
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'indent-guide-mode)
(add-hook 'before-save-hook 'time-stamp)

;; Configuring flyspell to avoid syntax check in math, code block

(provide 'init-markdown)
