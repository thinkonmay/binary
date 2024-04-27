
# Ensure Sunshine can grab images from KMS
path_to_setcap=$(which setcap)
if [ -x "$path_to_setcap" ] ; then
	$path_to_setcap cap_sys_admin+p $(readlink -f $(which ./shmsunshine))
fi

# Trigger udev rule reload for /dev/uinput
path_to_udevadm=$(which udevadm)
if [ -x "$path_to_udevadm" ] ; then
  $path_to_udevadm control --reload-rules
  $path_to_udevadm trigger --property-match=DEVNAME=/dev/uinput
fi

export DISPLAY=:0

# Check existing X server
ps -e | grep X >/dev/null
[[ ${?} -ne 0 ]] && {
 echo "Starting X server"
 startx &>/dev/null &
 [[ ${?} -eq 0 ]] && {
   echo "X server started successfully"
 } || echo "X server failed to start"
} || echo "X server already running"

# ./daemon