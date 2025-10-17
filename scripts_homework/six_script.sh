#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь_к_директории>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Ошибка: Директория '$directory' не существует"
    exit 1
fi

files=$(find "$directory" -type f -mtime +7)


if [ -z "$files" ]; then
    echo "Файлы, изменённые более 7 дней назад, не найдены."
    exit 0
fi

echo "Найдены следующие файлы, изменённые более 7 дней назад:"
echo "$files"
echo

read -p "Вы уверены, что хотите удалить эти файлы? (y/n): " confirmation
if [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; then
    echo "Удаление отменено."
    exit 0
fi


find "$directory" -type f -mtime +7 -exec rm -v {} \;


echo "Удаление файлов, изменённых более 7 дней назад, завершено."
