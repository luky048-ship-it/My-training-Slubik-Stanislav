read -p "Введите имя фийла: " filename

if [[ -f "$filename" ]]; then
	echo "Фаил найден."
else
	echo "Фаил не найден."
fi
