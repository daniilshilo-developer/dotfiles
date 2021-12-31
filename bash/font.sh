# Шрифты
function font() {

	# Устанавливаем unzip, для того чтобы работать с архивами
	sudo $pckg_manager unzip

	# Директория для шрифтов
	font_dir="$HOME/.local/share/fonts"

	# Шрифты, которые мы будем качать с NerdFonts
	fonts=( "FiraCode" "Agave")

	# Пробегаемся по массиву шрифтов
	for font in "${fonts[@]}"
	do
		# Качаем шрифт
		curl -fLo $font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip 

	# Создадим нужную директорию
	mkdir -p $font_dir

	# Разархивируем в правильную директорию
	unzip $font.zip -d $font_dir

	# Удалим скачанные шрифты (zip)
	rm -rf $font.zip
done

# Обновим кэш
fc-cache -fv $font_dir
}

font
