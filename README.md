# DOTFILES

## Setup

1. clone the repo
2. set up links:

```
cd ~
mkdir -p ~/.config/nvim/
mkdir -p ~/.local/share/nvim/site/
mv .gitconfig .gitconfig.bak
ln -fs ~/dotfiles/.gitconfig
mv .bashrc .bashrc.bak
ln -fs ~/dotfiles/.bashrc
ln -fs ~/dotfiles/.zshrc
ln -fs ~/dotfiles/.zprofile
ln -fs ~/dotfiles/.emacs
ln -fs ~/dotfiles/.tmux.conf
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.vimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.nvimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.config/fontconfig/.fonts.conf ~/.config/fontconfig/.fonts.conf
ln -fs vim ~/dotfiles/.vim/autoload ~/.local/share/nvim/site/autoload

```
