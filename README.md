How to get chroot Ubuntu 24.10, box64 and wine to work on Android.

First follow this guide:
https://ivonblog.com/en-us/posts/termux-chroot-ubuntu/

Then install all this depends

sudo apt-get install -y  libc6 libglib2.0-0 libgphoto2-6 libgphoto2-port12 \
		libgstreamer-plugins-base1.0-0 libgstreamer1.0-0  libopenal1 libpcap0.8 \
		libpulse0 libsane1 libudev1 libunwind8 libusb-1.0-0 libvkd3d1 libx11-6 libxext6 \
		ocl-icd-libopencl1 libasound2-plugins libncurses6 libcups2 \
		libdbus-1-3 libfontconfig1 libfreetype6 libglu1-mesa libgnutls30 \
		libgssapi-krb5-2 libkrb5-3  libosmesa6 libsdl2-2.0-0 libv4l-0 \
		libxcomposite1 libxcursor1 libxfixes3 libxi6 libxinerama1 libxrandr2 \
		libxrender1 libxxf86vm1 libc6 libcap2-bin libasound2t64 libldap-common libncurses6 libjpeg-turbo8 libodbc2
sudo apt-get install v4l-utils
sudo apt-get install winbind
sudo apt-get install ubuntu-restricted-extras
sudo apt install ffmpeg
sudo 
apt install pv pip libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio -y

Error
sudo apt remove gstreamer1.0-plugins-bad

git clone https://github.com/ptitSeb/box64 &>/dev/null
        echo "Building Box64..."
        cd ~/box64
        mkdir build; cd build; cmake .. -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD8G2=ON; make -j8; make install
        rm -r ~/box64


sudo apt-get install software-properties-common
sudo add-apt-repository ppa:mastag/mesa-turnip-kgsl
sudo apt update
sudo apt-get install mesa-vulkan-drivers

sudo apt install vulkan-tools

sudo apt install eget

Wget https://raw.githubusercontent.com/nydal91/Box64droidconf/refs/heads/main/OverrideDlls.bat

box64 wine OverrideDlls.bat
