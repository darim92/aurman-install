#!/bin/bash

# make temp dir
mkdir -p /tmp/pacaur_install
cd /tmp/aurman_install

echo "installing dependencies..."

# install dependencies
sudo pacman -S binutils make gcc fakeroot pkg-config --noconfirm --needed
sudo pacman -S git python python-regex python-requests ---noconfirm --needed

echo "installing expac-git..."

# install expac-git
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=expac-git
makepkg PKGBUILD --skippgpcheck --install --needed

echo "installing expac-git..."

# install aurman
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=aurman
makepkg PKGBUILD --skippgpcheck --install --needed

# clean up
cd ~
rm -r /tmp/aurman_install
echo "enjoy aurman!"
echo "-------------"

# install pamac
read -p "install pamac? [y/n]" answer
if [[ $answer = y ]] ; then
  aurman -S pamac-aur --noconfirm
  echo "pamac is ready..."
fi

echo "end..."
exit 0
