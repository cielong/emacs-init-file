# My emacs init repo
This is a repo for storing and sharing my emacs init file, I create my init file
structure mainly based on [Purcell's init file](https://github.com/purcell/emacs.d)
and [margnar's init file](https://github.com/magnars/.emacs.d).  
This init file is mainly for python-programming and markdown-text.  

## Features
* Dired-sidebar(`C-c C-f`) & Buffer-sidebar(`C-c C-b`)
  * Allow customization of hidden files in dired-mode
* Pre-populate git commit message with appropriate git template.
  * Allow simple scripting in git template, currently support auto-replacement
  of the following variable:
    1. ${BRANCH_NAME}: current branch name

## Getting Start
### Prerequisites
* Emacs for MAC >= 26.2

### Installation
* Using `git clone git@github.com:cielong/emacs-init-file.git` to download the repo, and put it into your home directory.
