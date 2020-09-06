#!/bin/bash

###    Author: KhaiPhan (khaiphan9x@gmail.com)

OSNAME=UNKNOWN

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
if [ "x$OSNAMEVER" = "x" ] ; then
    echo "Khong ho tro he dieu hanh cua ban."
    echo
    exit 1
fi
