echo
echo "SETUP"
echo "INSTALLING: ZSH"
echo

# ------------------------------------------------------------------------

echo
echo "INSTALLING OH-MY-ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ------------------------------------------------------------------------

echo
echo "INSTALLING PLUGINS"

# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ------------------------------------------------------------------------

echo
echo "LINKING DOTFILES"
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.aliases > /dev/null 2>&1

ln -fs ~/postinstall/zshrc ~/.zshrc
ln -fs ~/postinstall/aliases ~/.aliases

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
