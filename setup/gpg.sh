#!/bin/bash

echo
echo "SETUP"
echo "INSTALLING GPG"
echo

# ------------------------------------------------------------------------

echo
echo "Installing apt packages"

PKGS=(
    'gnupg2'
    'gnupg-agent'
    'scdaemon'
    'pcscd'
    'pass'
    'python3-pip'
    'python3-pyscard'
    'yubikey-personalization'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo apt install -y "$PKG"
done

echo
echo "Installing python"

PKGS=(
    'PyOpenSSL'
    'yubikey-manager'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pip3 install "$PKG"
done

# ------------------------------------------------------------------------

echo
echo "GPG Config"

gpgdir=~/.gnupg

[[ -e $gpgdir ]] &&  rm -rf $gpgdir
mkdir $gpgdir

find $gpgdir -type f -exec chmod 600 {} \;
find $gpgdir -type d -exec chmod 700 {} \;

cd $gpgdir
## Download config
wget https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf

## Import public key
gpg --keyserver keyserver.ubuntu.com --search-key pawel.lisewski@tuta.io

## Edit key trust
gpg --edit-key pawel.lisewski@tuta.io

gpg -k

# ------------------------------------------------------------------------

echo
echo "Export public ssh key"

sshdir=~/.ssh

[[ -e $sshdir ]] &&  rm -rf $sshdir
mkdir $sshdir

gpg --export-ssh-key pawel.lisewski@tuta.io > ~/.ssh/id_rsa.pub

# ------------------------------------------------------------------------

echo
echo "Enabling PC/SC Smart Card Daemon"

sudo systemctl enable --now pcscd.service

~/.local/bin/ykman info

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
