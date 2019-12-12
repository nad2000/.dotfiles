
export PATH="$HOME/.cargo/bin:$PATH"
[ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ] && exec startx

if which xinput &>/dev/null ; then
  touchpad_id=$(xinput list | sed -n '/touchpad/I s/.*id=\([0-9]*\).*/\1/p')
  function disable-touchpad() {xinput set-prop ${touchpad_id} "Device Enabled" 0}
  function enable-touchpad() {xinput set-prop  ${touchpad_id} "Device Enabled" 1}
  xinput list | grep -q -i mouse && disable-touchpad
fi
