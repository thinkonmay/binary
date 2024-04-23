
sudo dnf install boost-filesystem-1.81.0 \
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

sudo setcap cap_sys_admin+p $(readlink -f $(which ./shmsunshine)) && sudo ./daemon
