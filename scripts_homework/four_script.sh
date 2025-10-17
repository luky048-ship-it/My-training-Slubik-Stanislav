if [ -z "$1" ]; then
	echo "Укажите имя фийла"
	exit 1
fi

line_count=$(wc -1 < "$1")


echo "количество строк: $line_count"
