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

# btop
cp btop.conf ~/.config/btop/

# Neovim
cp init.lua ~/.config/nvim/

# Kitty
cp kitty.conf ~/.config/kitty/
