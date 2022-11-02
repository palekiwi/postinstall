echo
echo "SETUP: BASE PACKAGES"
echo

# ------------------------------------------------------------------------

echo
echo "Installing packages"

PKGS=(
    'curl'
    'ssh'
    'wget'
    'unzip'
    'zip'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo apt install -y "$PKG"
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
