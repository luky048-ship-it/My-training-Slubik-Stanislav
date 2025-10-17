#!/bin/bash

THRESHOLD=80

disks=$(df -h --output=source,used,avail,pcent,target | grep -vE 'tmpfs|devtmpfs' | tail -n +2)

if [ -z "$disks" ]; then
    echo "Ошибка: Не найдено смонтированных дисков"
    exit 1
fi

warning_issued=false

while IFS= read -r line; do
    usage=$(echo "$line" | awk '{print $4}' | tr -d '%')
    disk=$(echo "$line" | awk '{print $1}')
    mount_point=$(echo "$line" | awk '{print $5}')

    if [ "$usage" -gt "$THRESHOLD" ]; then
        echo "Предупреждение: Использование диска на $mount_point ($disk) составляет ${usage}% (более ${THRESHOLD}%)"
        warning_issued=true
    fi
done <<< "$disks"

if [ "$warning_issued" = false ]; then
    echo "Все диски используют менее ${THRESHOLD}%"
fi
