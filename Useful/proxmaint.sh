#!/bin/bash
# Created by Curtis Ferguson.
# Script is meant to automate backups, and upgrading my sole mini PC running proxmox and a few docker containers.


ntfyURL="NTFY_URL"
SUMMARY=""
BLUE='\033[0;34m'
NC='\033[0m'

LOG="/var/log/pvemaint/pve-maint.log"
exec > >(tee -a "$LOG") 2>&1
echo
echo -e "${BLUE}===== $(date '+%F %T') start =====${NC}"

notify() {

   local title="$1"
   local message="$2"

   curl -H "Title: $title" -d "$message" "$ntfyURL" -s -o /dev/null

}

#check if usb storage device is mounted
if mountpoint -q /mnt/usb-backup; then

    echo "USB Device: mounted"
    SUMMARY+="USB Device: Mounted"$'\n'

else

    echo "USB Device: Not Mounted"
    SUMMARY+="USB Device: Not Mounted"$'\n'
    notify "Maintenance Failure ❌" "$SUMMARY"

    exit 1

fi

#run backup onto usb device
if vzdump --all --storage usb-backup --compress zstd --prune-backups keep-last=2; then

    echo "Backup: Successful"
    SUMMARY+="Backup: Successful"$'\n'

else

    echo "Backup: Failed"
    SUMMARY+="Backup: Failed"$'\n'
    notify "Maintenance Failure ❌" "$SUMMARY"

    exit 1

fi

# Size of backup
backsize=$(du -sh /mnt/usb-backup/dump | cut -f1)
echo "Backup Size: $backsize"
SUMMARY+="Backup Size: $backsize"$'\n'

# Storage Amout Used
mntused=$(df -h /mnt/usb-backup --output=pcent | tail -n 1)
echo "USB Device Used: $mntused"
SUMMARY+="Storage Used: $mntused"$'\n'

# Updating proxmox server
if apt-get update; then

   echo "Update: Successful"
   SUMMARY+="Update: Successful"$'\n'

else

   echo "Update: Failed"
   SUMMARY+="Update: Failed"$'\n'
   notify "Maintenance Failure ❌" "$SUMMARY"

   exit 1

fi

# Package Count
pack=$(apt-get -s dist-upgrade | grep -c '^Inst')
echo "Packages Upgrading: $pack"
SUMMARY+="Packages Upgrading: $pack"$'\n'

# Upgrading proxmox server

if DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade; then

   echo "Upgrade Successful"
   SUMMARY+="Upgrade: Successful"$'\n'

else

   echo "Upgrade: Failed"
   SUMMARY+="Upgrade: Failed"$'\n'
   notify "Maintenance Failure ❌" "$SUMMARY"

   exit 1

fi

# Reboot or to not reboot?

curkern=$(uname -r)
waiting_kern=$(ls /boot/vmlinuz-* | sort -V | tail -n 1 | sed 's|/boot/vmlinuz-||')
uptime_sec=$(cut -d. -f1 /proc/uptime)
uptime_days=$(( uptime_sec / 86400 ))

if [[ "$curkern" != "$waiting_kern" ]]; then

   echo "New Kernel Waiting"
   reason="New Kernel"

elif [[ "$uptime_days" -ge 30 ]]; then

   echo "Uptime too large"
   reason="Uptime over 30 days"

else

  reason=""

fi

# Send summary and reboot if needed
if [[ -n "$reason" ]]; then

   echo "Rebooting: $reason"
   SUMMARY+="Rebooting: $reason"$'\n'
   notify "Maintenance Successful ✅" "$SUMMARY"

   reboot

else

   echo "No reboot needed"
   SUMMARY+="Reboot: Not needed"$'\n'
   notify "Maintenance Successful ✅" "$SUMMARY"

fi
