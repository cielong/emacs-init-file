(require 'package)

;; Add melpa to package repo
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  package-refresh-contents)

(defun install-package (packages)
  (--each packages
          (when (not (package-installed-p it))
            (install-package it)))
  (delete-other-windows))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION. 
If NO-REFRESH is non-nil, the availabel package lists will not be redownloaded in-order to locate PACKAGE"
  (if (package-installed-p package min-version) t
    (if (or (assoc package package-archive-contents) no-refresh)
        (install-package package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'init-elpa)
