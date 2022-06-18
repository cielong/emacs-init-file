(require 'use-package)

;; customize the themes path for not polluting `.emacs.d'
;; See https://www.emacswiki.org/emacs/CustomThemes
(add-to-list 'custom-theme-load-path (expand-file-name "themes/material-theme/" user-emacs-directory))

(use-package material-theme
  :ensure t
  :config
    (load-theme 'material t))

;;(global-hl-line-mode 1)

(provide 'init-theme)
