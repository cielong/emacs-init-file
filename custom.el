(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete t)
 '(eclim-executable "/Users/cielo/.p2/pool/plugins/org.eclim_2.7.2/bin/eclim")
 '(eclim-problems-show-pos t)
 '(eclimd-autostart-with-default-workspace t)
 '(eclimd-default-workspace "~/Documents/Java/")
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".DS_Store")))
 '(markdown-command
   "/usr/local/bin/pandoc -s --mathjax --meta pagetitle=live-preview")
 '(markdown-enable-math t)
 '(markdown-xhtml-header-content "<link rel=\"stylesheet\" href=\"tufte.css\"/>")
 '(package-selected-packages
   (quote
    (use-package-ensure-system-package yaml-mode sbt-mode scala-mode docker dockerfile-mode use-package pipenv string-inflection tern-auto-complete js2-refactor xref-js2 company-tern tern tide go-mode company-emacs-eclim ac-emacs-eclim eclim meghanada pdf-tools multiple-cursors rainbow-mode emmet-mode ac-js2 column-marker conda anaconda-mode json-mode nyan-mode web-mode py-autopep8 protobuf-mode projectile pandoc-mode multi-term matlab-mode markdown-toc magithub julia-mode jedi-direx indent-guide impatient-mode flyspell-correct flycheck-julia exec-path-from-shell elpy ein dracula-theme darcula-theme better-defaults)))
 '(pdf-info-epdfinfo-error-filename "/tmp/epdfinfo.log")
 '(pdf-info-epdfinfo-program
   "/Users/cielo/.emacs.d/elpa/pdf-tools-20180109.1234/build/server/")
 '(pdf-tools-handle-upgrades nil)
 '(python-shell-interpreter "python")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-problems-highlight-error-face ((t (:foreground "red" :weight bold))))
 '(eclim-problems-highlight-warning-face ((t (:foreground "yellow" :weight bold))))
 '(indent-guide-face ((t (:foreground "#535353" :slant oblique))))
 '(web-mode-variable-name-face ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue")))))
