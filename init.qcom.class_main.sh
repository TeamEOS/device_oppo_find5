#!/system/bin/sh

baseband=`getprop ro.baseband`
netmgr=`getprop ro.use_data_netmgrd`

case "$baseband" in
    "true")
    start qmuxd
esac

case "$netmgr" in
    "mdm")
    start netmgrd
esac
