if [ -z "$1" ]; then
	echo "Необходимо указать директорию для архивации."
	exit 1
fi

DIRECTORY=$1


CURRENT_DATE=$(date '+%Y-%m-%d')


ARCHIVE_NAME="${DIRECTORY}_${CURRENT_DATE}.tar.gz"


if [ ! -d "${DIRECTORY}" ]; then
	echo "Директория ${DIRECTORY} не найдена."
	exit 1
fi


tar -czvf "${ARCHIVE_NAME}" "${DIRECTORY}"


echo "Архив ${ARCHIVE_NAME} успешно создан."
