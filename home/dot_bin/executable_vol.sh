#!/usr/bin/env bash

TAG="vol.sh"
APP="vol.sh"

info() { pactl list sinks; }
lstrip() { printf '%s\n' "${1##"$2"}"; }
toggle() { pactl set-sink-mute @DEFAULT_SINK@ toggle >/dev/null; }
status() { lstrip "$(pactl get-sink-mute @DEFAULT_SINK@ | head -n 1)" 'Mute: '; }
vol() { pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'; }

muted() {
	dunstify \
		-u low \
		-i "$1" \
		-a "$APP" \
		-h string:x-dunst-stack-tag:$TAG "Volume muted"
}

volbar() {
	dunstify \
		-u low \
		-i "$1" \
		-a "$APP" \
		-h string:x-dunst-stack-tag:$TAG \
		-h int:value:"$(vol)" "Volume: $(vol)%"
}

if [[ "$1" == "toggle" ]]; then toggle; else
	pactl set-sink-mute @DEFAULT_SINK@ false
	if [[ "$(vol)" -gt 100 ]]; then
		pactl set-sink-volume @DEFAULT_SINK@ "100%" >/dev/null
	else
		pactl set-sink-volume @DEFAULT_SINK@ "$1" >/dev/null
	fi
fi

if [[ $(vol) == 0 || "$(status)" == "yes" ]]; then
	muted "notification-audio-volume-muted"
else
	if [[ $(vol) -gt 0 && $(vol) -le 33 ]]; then
		volbar "notification-audio-volume-low"
	elif [[ $(vol) -gt 33 && $(vol) -le 66 ]]; then
		volbar "notification-audio-volume-medium"
	elif [[ $(vol) -gt 66 && $(vol) -le 100 ]]; then
		volbar "notification-audio-volume-high"
	fi
fi
