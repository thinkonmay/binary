yum install boost-filesystem-1.74.* \
            boost-locale-1.74.* \
            boost-log-1.74.* \
            boost-program-options-1.74.* \
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

sudo setcap cap_sys_admin+p $(readlink -f $(which ./shmsunshine)) && sudo ./daemon