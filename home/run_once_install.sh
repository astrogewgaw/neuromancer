#!/usr/bin/env bash

STATUS="disabled"

declare -A urls
declare -A paths

hi() {
	cls
	echo " ███▄    █ ▓█████  █    ██  ██▀███   ▒█████   ███▄ ▄███▓ ▄▄▄       ███▄    █  ▄████▄  ▓█████  ██▀███  "
	echo " ██ ▀█   █ ▓█   ▀  ██  ▓██▒▓██ ▒ ██▒▒██▒  ██▒▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ ▒██▀ ▀█  ▓█   ▀ ▓██ ▒ ██▒"
	echo "▓██  ▀█ ██▒▒███   ▓██  ▒██░▓██ ░▄█ ▒▒██░  ██▒▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒▒▓█    ▄ ▒███   ▓██ ░▄█ ▒"
	echo "▓██▒  ▐▌██▒▒▓█  ▄ ▓▓█  ░██░▒██▀▀█▄  ▒██   ██░▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒▒▓▓▄ ▄██▒▒▓█  ▄ ▒██▀▀█▄  "
	echo "▒██░   ▓██░░▒████▒▒▒█████▓ ░██▓ ▒██▒░ ████▓▒░▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░▒ ▓███▀ ░░▒████▒░██▓ ▒██▒"
	echo "░ ▒░   ▒ ▒ ░░ ▒░ ░░▒▓▒ ▒ ▒ ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ░▒ ▒  ░░░ ▒░ ░░ ▒▓ ░▒▓░"
	echo "░ ░░   ░ ▒░ ░ ░  ░░░▒░ ░ ░   ░▒ ░ ▒░  ░ ▒ ▒░ ░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░  ░  ▒    ░ ░  ░  ░▒ ░ ▒░"
	echo "   ░   ░ ░    ░    ░░░ ░ ░   ░░   ░ ░ ░ ░ ▒  ░      ░     ░   ▒      ░   ░ ░ ░           ░     ░░   ░ "
	echo "         ░    ░  ░   ░        ░         ░ ░         ░         ░  ░         ░ ░ ░         ░  ░   ░     "
	echo "                                                                             ░                        "
}

cls() { printf "\e[2J\e[H"; }
say() { printf '\e[1m%s\e[m\n' "$1"; }
host() { printf '%s' "${HOSTNAME:-$(hostname)}"; }

user() {
	: \\u
	printf '%s' "${_@P}"
}

paths[py]="$HOME/conda/bin/python"
paths[cz]="$HOME/.local/share/chezmoi"

urls[yay]="https://aur.archlinux.org/yay-bin.git"
urls[tempo]="http://git.code.sf.net/p/tempo/tempo"
urls[presto]="https://github.com/scottransom/presto"
urls[omz]="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
urls[miniconda]="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"

pkgs=(
	"alacritty"
	"alsa-plugins"
	"alsa-utils"
	"atuin"
	"avahi"
	"bat"
	"bluez"
	"bluez-utils"
	"bottom"
	"brightnessctl"
	"cfitsio"
	"cmake"
	"cmatrix"
	"cool-retro-term"
	"cups"
	"cups-pdf"
	"curl"
	"duf"
	"dunst"
	"dust"
	"exa"
	"fd"
	"feh"
	"ffmpeg"
	"ffmpegthumbnailer"
	"fftw"
	"firefox"
	"flameshot"
	"fzf"
	"gdb"
	"git-delta"
	"github-cli"
	"go"
	"gping"
	"gzip"
	"haveged"
	"hunspell"
	"hunspell-en_us"
	"hyperfine"
	"i3-wm"
	"i3lock"
	"imagemagick"
	"inkscape"
	"intel_media_driver"
	"just"
	"lazygit"
	"man-db"
	"man-pages"
	"mtools"
	"neofetch"
	"nnn"
	"nodejs"
	"noto-fonts-cjk"
	"noto-fonts-emoji"
	"npm"
	"ntfs-3g"
	"okular"
	"openssh"
	"pacman-contrib"
	"playerctl"
	"pulseaudio"
	"pulseaudio-alsa"
	"pulseaudio-bluetooth"
	"python-pillow"
	"python-pywal"
	"python2"
	"reflector"
	"ripgrep"
	"rofi"
	"rsync"
	"solaar"
	"starship"
	"tectonic"
	"tokei"
	"udiskie"
	"udisks2"
	"ueberzug"
	"unrar"
	"unzip"
	"vlc"
	"watchexec"
	"wget"
	"xdotool"
	"xorg-server"
	"xorg-xev"
	"xorg-xinit"
	"xorg-xrandr"
	"xsel"
	"zellij"
	"zig"
	"zsh"
)

extras=(
	"bibata-cursor-theme-bin"
	"eww"
	"faba-icon-theme"
	"firefox-extension-arch-search"
	"hw-probe"
	"julia-bin"
	"linux-wifi-hotspot"
	"mkinitcpio-firmware"
	"ncspot-bin"
	"pandoc-bin"
	"peaclock"
	"pgplot"
	"pipes.c"
	"quarto-cli-bin"
	"rtw88-dkms-git"
	"slack-desktop"
	"ttf-juliamono"
	"typst"
	"zoom"
	"zotero-bin"
)

pys=(
	"astropy"
	"click"
	"jupyter"
	"numpy"
	"pipx"
	"proplot"
	"pytest"
	"pytest-cov"
	"rich"
	"scipy"
	"setuptools"
	"ward"
	"wheel"
)

pac_install() {
	say "Installing $*..."
	sudo pacman -S "$@" --noconfirm --needed
	cls
}

aur_install() {
	say "Installing $*..."
	yay -S --noconfirm "$@"
	cls
}

update_core() {
	say "Configuring pacman and updating the entire system..."
	sudo pacman-key --delete all
	sudo pacman-key --populate archlinux
	sudo pacman -Syy
	sudo pacman -Suu
	cls
}

install_yay() {
	if ! type -p yay &>/dev/null; then
		say "Installing yay: the AUR helper..."
		pac_install git base-devel
		git clone "${urls[yay]}"
		cd yay-bin || exit
		makepkg -si
		cd ..
		rm -rf yay-bin
		cls
	else
		say "Yay is already installed. Moving on..."
		cls
	fi
}

install_core() {
	for pkg in "${pkgs[@]}"; do
		pac_install "$pkg"
	done
}

install_extras() {
	install_yay
	for extra in "${extras[@]}"; do
		aur_install "$extra"
	done
}

install_omz() {
	if ! type -p omz &>/dev/null; then
		say "Installing OMZ..."
		sh -c "$(curl -fsSL "${urls[omz]}")" "" --keep-zshrc --unattended
		cls
	else
		say "OMZ is already installed. Moving on..."
		cls
	fi
}

install_miniconda() {
	if ! type -p conda &>/dev/null; then
		say "Installing Miniconda."
		wget "${urls[miniconda]}" -O "$HOME/miniconda.sh"
		bash "$HOME/miniconda.sh" -b -p "$HOME/conda"
		rm -rf "$HOME/miniconda.sh"
		cls
	else
		say "Miniconda is already installed. Moving on..."
		cls
	fi
}

install_nfs() {
	tempdir="$HOME/temp"
	fonts=("JetBrainsMono")
	fontdir="$HOME/.local/share/fonts"

	repo="ryanoasis/nerd-fonts"
	apiurl="https://api.github.com/repos/$repo/releases/latest"
	version="$(curl --silent "$apiurl" | grep -Po '"tag_name": "\K.*?(?=")')"
	release="https://github.com/$repo/releases/download/$version"

	say "Installing Nerd Fonts (Version: $version)..."
	for font in "${fonts[@]}"; do
		exists=$(fc-list | grep -i "$font")
		if [ -z "$exists" ]; then
			SX=0
			say "Nope. $font is not installed." &&
				say "Downloading..." &&
				mkdir -p "$tempdir" &&
				wget --show-progress -q "$release/$font.zip" -P "$tempdir" &&
				unzip -qq "$tempdir/$font.zip" -d "$fontdir" &&
				SX=1
		else
			say "$font is already installed."
		fi
	done

	if [ "$SX" -eq 1 ]; then
		say "Updating cache..." &&
			fc-cache -fv >/dev/null 2>&1 &&
			rm -rf "$tempdir"
	fi

	cls
}

install_tempo() {
	if ! type -p tempo &>/dev/null; then
		say "Installing TEMPO..."
		git clone "${urls[tempo]}" "$HOME/tempo"
		cd "$TEMPO" || exit
		source prepare
		./configure
		sudo make
		sudo make install
		cd "$HOME" || exit
		cls
	else
		say "TEMPO is already installed. Moving on..."
		cls
	fi
}

install_presto() {
	if ! type -p prepfold &>/dev/null; then
		say "Installing PRESTO."
		git clone "${urls[presto]}" "$PRESTO"
		cd "$PRESTO/src" || exit
		make makewisdom
		make prep
		make
		make clean
		cd "$HOME" || exit
		cls
	else
		say "PRESTO is already installed. Moving on..."
		cls
	fi
}

python_setup() {
	say "Setting up the Python environment..."
	for pkg in "${pys[@]}"; do
		say "Installing: ${pkg}..."
		"${paths[py]}" -m pip install "$pkg"
		cls
	done
	"${paths[py]}" -m \
		pip install \
		--index-url https://test.pypi.org/simple/ \
		pywalfox==2.8.0rc1
	cls
}

rust_setup() {
	say "Setting up the Rust environment..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	cls
}

neovim_setup() {
	say "Setting up neovim..."
	"${paths[py]}" -m pip install pynvim
	sudo npm i -g neovim
	aur_install neovim-git
	cls
}

tex_setup() {
	say "Setting up TinyTeX..."
	wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
	cls
}

wallpaper_setup() {
	if [ ! -d "$HOME/walls" ]; then
		say "Setting up the wallpaper and theme..."
		udisksctl mount -b /dev/sdb1
		ln -s "$HDD/images/wallpapers/desktop" "$HOME/wallpapers"
		wal -i "$HOME/walls"
	else
		say "Wallpaper and theme already set."
	fi
	cls
}

setup() {
	hi

	sudo cp "${paths[cz]}/home/etc/pacman.conf" "/etc/pacman.conf"
	sudo cp "${paths[cz]}/home/etc/monitor.conf" "/etc/X11/xorg.conf.d/10-monitor.conf"

	update_core
	install_core
	install_extras

	install_nfs
	install_omz
	install_tempo
	install_presto
	install_miniconda

	tex_setup
	rust_setup
	python_setup
	neovim_setup
	wallpaper_setup

	hi
}

if [[ $STATUS == "enabled" ]]; then
	setup
fi
