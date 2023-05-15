export PATH="$PATH:$HOME/.local/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname compiz
tid=$(xinput --list | grep 'SynPS/2 Synaptics TouchPad' | awk '{print $6}'| cut -d'=' -f2)
xinput set-prop $tid  "libinput Accel Speed" 0.9

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
. "$HOME/.cargo/env"
