export LANG=en_US.UTF-8
export MANPAGER="less -X"
export LC_ALL="en_US.UTF-8"
export HDD="/run/media/$USER/codex"
export LESS="--ignore-case --quit-if-one-screen --quit-on-intr -FRXQ"

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nano'
else
	export EDITOR='nvim'
fi

export JULIA_DEVDIR="/home/upanda/codes/jl"
