#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Использование: $0 <команда>"
    exit 1
fi

"$@" &

pid=$!
echo "Команда '$*' запущена в фоновом режиме с PID: $pid"
