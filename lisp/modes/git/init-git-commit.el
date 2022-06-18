;; Common Lisp Library
(require 'cl-lib)

(defun* expand-commit-message()
  "Search and replace variables in git commit template when running `git commit'.
   The function search and replace the following variable:
   1. ${BRANCH_NAME}: get branch name by running `git rev-parse --abbrev-ref HEAD'
   2. ${BRANCH_DESCRIPTION}: get branch description by running `git config branch.${BRANCH_NAME}.description'
   3. ${CURSOR}: search the last ${CURSOR} variable and replace it with empty string and place cursor there
  "
  (when (and (stringp buffer-file-name)
	     (string-match "\.git\/COMMIT_EDITMSG$" buffer-file-name))
    ;; set BRANCH_NAME
    (setq BRANCH_NAME
	  (file-name-nondirectory
	   (substring
	    (shell-command-to-string "git rev-parse --abbrev-ref HEAD")
	    0 -1)))
    ;; replace ${BRANCH_NAME} with BRANCH_NAME
    (while (re-search-forward "${BRANCH_NAME}" nil t)
      (replace-match BRANCH_NAME t t))

    ;; move cursor to the begining
    (goto-char (point-min))

    ;; set BRANCH_DESCRIPTION
    (setq BRANCH_DESCRIPTION
	  (shell-command-to-string
	   (format "git config branch.%s.description" BRANCH_NAME)
	   ))
    ;; replace ${BRANCH_DESCCRIPTION} with BRANCH_DESCRIPTION
    (while (re-search-forward "${BRANCH_DESCRIPTION}" nil t)
      (replace-match BRANCH_DESCRIPTION t t))

    ;; move cursor to the begining
    (goto-char (point-max))

    ;; move to ${CURSOR}
    (if (re-search-backward "${CURSOR}" nil t)
	(replace-match "" t t)
        (goto-char (point-min)))
    ))

(add-hook 'find-file-hook 'expand-commit-message)
(provide init-git-commit)
