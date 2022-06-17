;; This is an initialization file loaded during Emacs startup, which is much
;; earlier than `init.el'.
;; Mainly used it for change package initialization process
;; For details, check
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html

;; Set up load path
(setq lisp-dir (expand-file-name "lisp" user-emacs-directory))
;; Add lisp
(add-to-list 'load-path lisp-dir)
;; Add all subdirectories under lisp
(let ((default-directory  lisp-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; Set up packages repo
(require 'init-packages)
