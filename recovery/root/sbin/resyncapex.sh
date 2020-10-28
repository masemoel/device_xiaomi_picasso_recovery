#!/sbin/sh
APEX_LIST=$(ls /apex/)
for APEX in ${APEX_LIST}
do
unmount ${APEX}
rm -rf ${APEX} 2&>/dev/null
done
