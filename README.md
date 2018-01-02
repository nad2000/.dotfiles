# DOTFILES

## Setup

1. clone the repo
2. set up links:

```
cd ~
mkdir -p ~/.config/nvim/ ~/.local/share/nvim/site/ ~/.config/Code/User/
mv .gitconfig .gitconfig.bak
ln -fs ~/dotfiles/.gitconfig
mv .bashrc .bashrc.bak
<<<<<<< HEAD
ln -fs ~/dotfiles/.bashrc
ln -fs ~/dotfiles/.zshrc
ln -fs ~/dotfiles/.zprofile
ln -fs ~/dotfiles/.emacs
ln -fs ~/dotfiles/.tmux.conf
=======
ln -fs ~/dotfiles/.bashrc 
ln -fs ~/dotfiles/.zshrc
ln -fs ~/dotfiles/.zprofile
ln -fs ~/dotfiles/.emacs 
ln -fs ~/dotfiles/.tmux.conf 
>>>>>>> 47819a4... .zprofile added..
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.vimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.nvimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.config/fontconfig/.fonts.conf ~/.config/fontconfig/.fonts.conf
ln -fs ~/dotfiles/.vim/autoload ~/.local/share/nvim/site/autoload
ln -fs ~/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json

```
