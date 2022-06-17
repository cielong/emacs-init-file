# Emacs Init
A repo for my Emacs init settings.

## Features
* Machine specific settings (***local.el***)
  * Allow customization for different machines (e.g. loading internal libs)
* Dired-sidebar(`C-c C-f`) & Buffer-sidebar(`C-c C-b`)
  * Allow customization of hidden files in dired-mode
* Pre-populate git commit message with appropriate git template.
  * Allow simple scripting in git template, currently support auto-replacement
  of the following variable (including the `${XXX}` symbol):
    1. ${BRANCH_NAME}: current branch name
    2. ${BRANCH_DESCRIPTION}: current branch description (see [Git Branch#Edit Description](https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---edit-description))
    3. ${CURSOR}: the final cursor position

## Getting Start
### Prerequisites
* Emacs for MAC >= 26.2

### Installation
1. Using `git clone git@github.com:cielong/emacs-init-file.git` to download the repo
2. Copy all the files into the ***~/.emacs.d*** directory.
