#!/sbin/sh

MODEM_STATE=$(find /sys/class/remoteproc/ -name "name" | xargs grep -l "modem" | sed 's/name/state/')

if [ -z "$MODEM_STATE" ]; then
    MODEM_STATE="/sys/kernel/boot_adsp/boot"
fi

echo "Monitoring modem state: $MODEM_STATE"

for i in $(seq 1 20); do
    STATE=$(cat $MODEM_STATE 2>/dev/null)
    echo "Current modem state: $STATE ($i)"
    
    if [ "$STATE" = "running" ] || [ "$STATE" = "1" ]; then
        echo "Modem is stable. Proceeding..."
        sleep 1
        setprop vendor.modem.stable 1
        exit 0
    fi
    sleep 1
done

setprop vendor.modem.stable 1
exit 0
