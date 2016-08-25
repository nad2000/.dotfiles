#dotfiles

## Setup

1. clone the repo
2. set up links:
```
cd ~
mv .gitconfig .gitconfig.bak 
ln -s ~/dotfiles/.gitconfig
mv .bashrc .bashrc.bak
ln -s ~/dotfiles/.bashrc 
ln -s ~/dotfiles/.emacs 
ln -s ~/dotfiles/.tmux.conf 
ln -s .nvimrc ~/dotfiles/.config/nvim/init.vim

```
