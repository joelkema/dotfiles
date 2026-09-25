# dotfiles

These are my dotfiles. I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) shell and [stow](http://www.gnu.org/software/stow/) to manage symlinks.

## setup

First we'll need to install [brew](http://brew.sh/):

## installation

All installation is done via the `install.sh` script. Comment/uncomment the sections relevant to you:

```
cd ~
git clone git@github.com:joelkema/dotfiles.git
cd dotfiles
source install.sh
```

On a brand new machine without an SSH key yet, clone over HTTPS first and switch to SSH later:

```
cd ~
git clone https://github.com/joelkema/dotfiles.git
cd dotfiles
source install.sh
# once your SSH key is set up on GitHub:
git remote set-url origin git@github.com:joelkema/dotfiles.git
```
