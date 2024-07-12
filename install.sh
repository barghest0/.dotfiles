sudo pacman -S git
git config --global user.email "a.bolshov@microline.ru"
git config --global user.email "barghest"

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

yay -S google-chrome 
yay -S telegram-desktop

git clone https://github.com/barghest0/.dotfiles.git

sudo pacman -S alacritty
yay -S alacritty-themes
ln -sr ~/.dotfiles/alacritty ~/.config/

ln -sr ~/.dotfiles/dwm/.dwm ~
sudo ln -s ~/.dotfiles/dwm/session/dwm.desktop /usr/share/xsessions/
chmod +x ~/.dotfiles/dwm/session/startdwm.sh
sudo ln -s ~/.dotfiles/dwm/session/startdwm.sh /usr/local/bin/

sudo pacman -S fastfetch

yay -S npm
sudo npm install -g typescript typescript-language-server

sudo pacman -S neovim
yay -S python python-pynvim
ln -sr ~/.dotfiles/nvim ~/.config
sudo pacman -S cmake luarocks
yay -S lua-language-server
yay -S fzfx

sudo pacman -S zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
sudo rm ~/.zshrc
ln ~/.dotfiles/zsh/.zshrc ~
echo "zsh" >> .bashrc

sudo pacman -S lazygit
ssh-keygen -t ed25519 -C "a.bolshov@microline.ru"
 
yay -S nerd-fonts

git clone https://github.com/pijulius/picom.git
cd picom
yay -S meson libev uthash
meson setup --buildtype=release build
ninja -C build
ninja -C build install
ln -sr ~/.dotfiles/picom ~/.config
cd ~

yay -S feh

yay -S dunst

yay -S polybar-dwm-git
yay -S yajl

yay -S flameshot

git clone git@github.com:barghest0/study-notes.git ~/notes
yay -S obsidian
yay -S syncthing
sudo systemctl enable syncthing@barghest.service
sudo systemctl start syncthing@barghest.service
