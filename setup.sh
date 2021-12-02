echo
echo "SETUP"
echo

# ------------------------------------------------------------------------

echo
echo "Installing packages"

PKGS=(
    'gnupg'
    'pam-u2f'
    'pass'
    'wget'
    'yubikey-manager'
    'zsh'
    'zsh-completions'
    'zsh-syntax-highlighting'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "INSTALLING OH-MY-ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ------------------------------------------------------------------------

echo
echo "INSTALLING AUTOSUGGESTIONS"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ------------------------------------------------------------------------

echo
echo "LINKING DOTFILES"
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.gitconfig > /dev/null 2>&1

ln -fs ~/postinstall/zshrc ~/.zshrc
ln -fs ~/postinstall/gitconfig ~/.gitconfig

# ------------------------------------------------------------------------

echo
echo "GPG Config"

mkdir ~/.gnupg
cd ~/.gnupg
## Download config
wget https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf

## Import public key
gpg --search-key pawel.lisewski@tuta.io

# ------------------------------------------------------------------------

echo
echo "Enabling PC/SC Smart Card Daemon"

sudo systemctl enable pcscd.service
sudo systemctl start pcscd.service

# ------------------------------------------------------------------------

echo
echo "Export public ssh key"

gpg --export-ssh-key pawel.lisewski@tuta.io > ~/.ssh/id_rsa.pub

# ------------------------------------------------------------------------

echo
echo "GPG Config"

echo
echo "Updating GPG Agent"

gpg-connect-agent updatestartuptty /bye

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
