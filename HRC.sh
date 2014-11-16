#!/bin/bash
CommentSub(){
    Name=$1;
    echo "";
    echo "###################################################################################################";
    echo "### $Name #############################################################################";
    echo "###################################################################################################";
    echo "";

}
HeadCheck(){
    CommentSub "HeadCheck";

    cat /proc/*info

    lsblk
    df -i
    df -ha
    fdisk -l
    hdparm -i /dev/sda
    smartctl -i /dev/sda
    iostat

    free -m

    dmidecode

    lspci -vv
    lsusb -vv

    #sudo  yum install lshw
    lshw

}
OSCheck(){
    CommentSub "OSCheck";
    uname -a
    cat /etc/redhat-release
}
PackageCheck(){
    CommentSub "PackageCheck";
    rpm -a
    yum list
    lsmod
}
ProsaseCheck(){
    CommentSub "ProsaseCheck";
    top -n 1
    ps axuw
    pstree
    pstree -aclp
}
NetworkCheck(){
    CommentSub "NetworkCheck";
    /sbin/ifconfig -a

    ethArray=$(/sbin/ifconfig -a | grep Ethernet | awk '{print $1}');
    for str in ${ethArray}; do
        #sudo /usr/sbin/ethtool $str
        /usr/sbin/ethtool $str
    done

    netstat -rn
    netstat -an
    cat /etc/resolv.conf
    cat /etc/ntp.conf
    cat /etc/hosts.allow
    cat /etc/hosts.deny
    iptables -L
}
ETCCheck(){
    CommentSub "ETCCheck";
    dmesg
}


MAIN(){
    HeadCheck;
    OSCheck;
    PackageCheck;
    ProsaseCheck;
    NetworkCheck;
    ETCCheck;
}
MAIN;

