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

cp ~/postinstall/zshrc ~/.zshrc
cp ~/postinstall/aliases ~/.aliases

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
