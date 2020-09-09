#!/bin/bash

###    Author: KhaiPhan (khaiphan9x@gmail.com)

OSNAME=

if [ -f /etc/lsb-release ] ; then
    OSNAME=UBUNTU
elif [ -f /etc/debian_version ] ; then
    cat /etc/debian_version | grep "^kali" >/dev/null
    if [ $? = 0 ] ; then
        OSNAME=KALI
    else
        OSNAME=DEBIAN
    fi
fi
if [ "x$OSNAME" = "x" ] ; then
    echo
    echo "Khong ho tro OS cua ban."
    echo
    exit 1
fi

clean

if [ "x$OSNAME" = "xUBUNTU" ] ; then
    sudo apt -y install xfce4 xfce4-terminal
    #sudo apt -y install mate-core mate-desktop-environment mate-notification-daemon
elif [ "x$OSNAME" = "xDEBIAN" ] ; then
    sudo apt -y install xfce4 xfce4-terminal
elif [ "x$OSNAME" = "xKALI" ] ; then
    sudo apt -y install kali-desktop-xfce compton
    #sudo apt install kali-desktop-gnome compton
fi

sudo apt-get install xrdp -y
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
sudo /etc/init.d/xrdp start

echo
echo "Cai dat thanh cong. GUI dang co san tai localhost:3390, hay su dung Microsoft Remote Desktop Connect de ket noi."
echo "Tam biet."
