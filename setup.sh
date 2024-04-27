
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

yum install boost-filesystem-1.81.0 \
            boost-locale-1.81.0 \
            boost-log-1.81.0 \
            boost-program-options-1.81.0 \
            libcap  \
            libcurl  \
            libdrm   \
            libevdev   \
            libopusenc   \
            libva   \
            libvdpau  \
            libwayland-client   \
            libX11   \
            miniupnpc   \
            numactl-libs   \
            openssl   \
            pulseaudio-libs 