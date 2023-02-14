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

export ARCHFLAGS="-arch x86_64"

export TEMPO="$HOME/tempo"
export PRESTO="$HOME/presto"
export PGPLOT_DIR="/usr/lib"
export LD_LIBRARY_PATH="$PRESTO/lib:$LD_LIBRARY_PATH"

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUGS="p:preview-tui;w:wallpaper"
