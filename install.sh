# Emacs
cp .emacs ~/.emacs.d/.emacs

# Zsh
cp .zshrc ~
git clone https://github.com/13-CF/afetch
cd afetch
cp ../config.h ./src/config.h
make
sudo cp afetch /bin/afetch
cd ..
yay -S zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search icons-in-terminal exa ttf-monoid-nerd
touch ~/git-prompt.sh
touch ~/git_stuff.sh

# btop
cp btop.conf ~/.config/btop/

# Neovim
cp init.lua ~/.config/nvim/

# Kitty
cp kitty.conf ~/.config/kitty/
cp current-theme.conf ~/.config/kitty/
