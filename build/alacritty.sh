#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release

if [ -e /etc/os-release ]; then
	. /etc/os-release
	case "$ID" in
		ubuntu)
			sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
			sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
			sudo desktop-file-install extra/linux/Alacritty.desktop
			sudo update-desktop-database
			;;
		*)
			echo "Unknown distribution $ID"
			;;
	esac
else
	echo "Unable to determine the distribution
fi

cd ..
rm -rf alacritty
