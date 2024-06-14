# Fish
mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/

# Afetch
git clone https://github.com/13-CF/afetch
cd afetch
cp ../config.h ./src/config.h
make
sudo cp afetch /bin/afetch
cd ..
yay -S exa ttf-monoid-nerd
git clone https://github.com/sebastiencs/icons-in-terminal
cd icons-in-terminal
./install-autodetect.sh
./print_icons.sh
cd ..

# btop
mkdir -p ~/.config/btop
cp btop.conf ~/.config/btop/

# Neovim
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim/

# Kitty
mkdir -p ~/.config/kitty
cp kitty.conf ~/.config/kitty/
cp current-theme.conf ~/.config/kitty/
