# .DOTFILES

## Setup

1. clone the repo
2. set up links:

```
cd
mkdir -p ~/.config/nvim/ ~/.local/share/nvim/site/ ~/.config/Code/User/ ~/.w3m
[ -f .gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bak
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
ln -fs ~/.dotfiles/.gitconfig
ln -f /home/rcir178/.dotfiles/.aliases
ln -f ~/.dotfiles/.profile
ln -f ~/.dotfiles/.bashrc
ln -f ~/.dotfiles/.muttrc
ln -f ~/.dotfiles/.zshrc ~/.zshrc.pre-oh-my-zsh
ln -f ~/.dotfiles/.zshrc.oh-my-zsh ~/.zshrcgt
ln -f ~/.dotfiles/.zshenv
ln -f ~/.dotfiles/.zprofile
ln -f ~/.dotfiles/.emacs
ln -f ~/.dotfiles/.tmux.conf
ln -f ~/.dotfiles/.clang-format
ln -fs ~/.dotfiles/.config/nvim/init.vim ~/.vimrc
ln -fs ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -fs ~/.dotfiles/.vim ~/.vim
ln -fs ~/.dotfiles/.vim/autoload ~/.local/share/nvim/site/autoload

ln -fs ~/.dotfiles/.passwd
ln -f ~/.dotfiles/.xinitrc
ln -f ~/.dotfiles/.xprofile
ln -f ~/.dotfiles/.mostrc
ln -f ~/.dotfiles/.pdbrc
ln -f ~/.dotfiles/bibliography.bib
# ln -sf ~/.dotfiles/.config/dunst ~/.config/dunst
# ln -sf ~/.dotfiles/.config/kitty ~/.config/kitty
# ln -sf ~/.dotfiles/.config/redshift.conf ~/.config/redshift.conf
# ln -sf ~/.dotfiles/.config/fontconfig/.fonts.conf ~/.config/fontconfig/.fonts.conf
# ln -sf ~/.dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
# ln -sf ~/.dotfiles/.config/sxhkd ~/.config/
# ln -sf ~/.dotfiles/.config/ptpython ~/.config/ptpython
# ln -sf ~/.dotfiles/.config/rofi ~/.config/rofi
for file in $(ls -1 ~/.dotfiles/.config | grep -v nvim); do
    ln -fs "~/.dotfiles/.config/$file" "~/.config/$file"
done
ln -sf ~/.dotfiles/.w3m/config -t ~/.w3m
ln -sf ~/.dotfiles/.w3m/keymap -t ~/.w3m
```
3. install stuff:

```
sudo apt-get install curl exuberant-ctags ack-grep neovim  ## for Debian based distros
sudo pacman -Sy curl ctags ack neovim ## For Arch Linux
pip install -U --user pep8 flake8 pyflakes isort yapf pip
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

4. install vim-plug[https://github.com/junegunn/vim-plug]:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

5. generate the locale: `sudo locale-gen ru_RU.UTF-8`
