# DOTFILES

## Setup

1. clone the repo
2. set up links:

```
cd
mkdir -p ~/.config/nvim/ ~/.local/share/nvim/site/ ~/.config/Code/User/
[ -f .gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bak
ln -fs ~/dotfiles/.gitconfig
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
ln -f ~/dotfiles/.bashrc
ln -f ~/dotfiles/.zshrc ~/.zshrc.pre-oh-my-zsh
ln -f ~/dotfiles/.zshrc.oh-my-zsh ~/.zshrcgt
ln -f ~/dotfiles/.zshenv
ln -f ~/dotfiles/.zprofile
ln -f ~/dotfiles/.emacs
ln -f ~/dotfiles/.tmux.conf
ln -f ~/dotfiles/.clang-format
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.vimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.nvimrc
ln -fs ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.config/fontconfig/.fonts.conf ~/.config/fontconfig/.fonts.conf
ln -fs ~/dotfiles/.vim/autoload ~/.local/share/nvim/site/autoload
ln -fs ~/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -fs ~/dotfiles/.config/sxhkd ~/.config/
ln -f ~/dotfiles/.xinitrc
ln -f ~/dotfiles/.xprofile
ln -f ~/dotfiles/.mostrc
```
3. install stuff:

```
sudo apt-get install curl exuberant-ctags ack-grep neovim  ## for Debian based distros
sudo pacman -Sy curl ctags ack neovim ## For Arch Linux
pip install -U --user pep8 flake8 pyflakes isort yapf pip

```

4. install vim-plug[https://github.com/junegunn/vim-plug]:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


