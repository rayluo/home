#!/bin/bash
KMONAD=~/kmonad
if ! [ -x "$KMONAD" ]; then
  wget https://github.com/kmonad/kmonad/releases/download/0.4.3/kmonad -O $KMONAD
  chmod +x $KMONAD
fi

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <kmonad_config> [kmonad_options]"
    exit 1
fi

echo "* If you haven't already, setup permissions first:"
echo "   https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-do-i-get-uinput-permissions"
echo "* Step 2's check might not work, use 'getent group' instead."
echo "* However, since I wasn't able to get uinput to work for my normal user,"
echo "  I had to run kmonad as root. Not sure whether step 1, 2, 3 would still be necessary."

KBD_DEVICE=$(find /dev/input/by-id/*kbd* | fzf)
export KBD_DEVICE
KBDCFG=$(envsubst < $1)

# Run kmonad with the second and the rest of the arguments
$KMONAD <(echo "$KBDCFG") "${@:2}"
