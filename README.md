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
rm -f .vimrc; ln -s ~/dotfiles/.config/nvim/init.vim .vimrc
rm -f .nvimrc; ln -s ~/dotfiles/.config/nvim/init.vim .nvimrc
rm -f ~/.config/nvim/init.vim; ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
rm -rf .vim; ln -s ~/dotfiles/.vim .vim
```
