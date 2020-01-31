(defun expand-commit-message()
  (when (and (stringp buffer-file-name)
	     (string-match "\.git\/COMMIT_EDITMSG$" buffer-file-name))
    (setq BRANCH_NAME
	  (substring
	   (shell-command-to-string "git rev-parse --abbrev-ref HEAD")
	   0 -1))
    (replace-string "${BRANCH_NAME}" BRANCH_NAME)))
(add-hook 'find-file-hook 'expand-commit-message)
(provide init-git-commit)
