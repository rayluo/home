# Disable default settings, so that ALT+number can work in Firefox, and ROXTerm
sed -e "/^KeySysWorkspace[0-9]\+=/s/^/#/g" -i.bak ~/.icewm/preferences

# Its default setting Alt+Shift+F? tends to conflict with other apps
sed -e "s/^[# ]*KeySysTileVertical.*/KeySysTileVertical=\"Alt+Ctrl+V\"/g" -i ~/.icewm/preferences

# Its default setting Alt+Shift+F? tends to conflict with other apps
sed -e "s/^[# ]*KeySysTileHorizontal.*/KeySysTileHorizontal=\"Alt+Ctrl+H\"/g" -i ~/.icewm/preferences

# Trigger current icewm session to reload the settings
killall -SIGHUP icewm

