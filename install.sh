#!/usr/bin/env bash

# Папка для конфигурации
CONFIG_DIR="$PWD/config"

# Если нет figlet - устанавливаем
if ! command -v figlet
then
	sudo pacman -Sy figlet
fi

#---                             ---#
# Метод для линкования конфигурации #
#---                             ---#
function config() {

	figlet "Neovim"
	sleep 2

	sudo pacman -Sy neovim python3-neovim ripgrep

	figlet "Kitty"
	sleep 2

	sudo pacman -Sy kitty tmux

	figlet "Node Version Manager"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

	figlet "Tmux"
	sleep 2

	# Настраиваем tmux
	tee $HOME/.tmux.conf <<EOF
# Поставить дефолтный терминал
#set -g default-terminal "screen-256color"
set -g default-terminal "xterm-256color"

# Хоткеи XTerm
setw -g xterm-keys on

# Время для комбинации клавиш
set -s escape-time 10
set -sg repeat-time 10

# Второй префикс
set -g prefix2 C-a
bind C-a send-prefix -2

# Кодировка
set -q -g status-utf8 on
setw -q -g utf8 on

# История
set -g history-limit 5000

# Нумерация
# Нумеровать окна с 1
set -g base-index 1

# Пересчитывать окна при закрытии
set -g renumber-windows on

# Нумеровать панели с 1
setw -g pane-base-index 1

# Хоткеи
# Хоткей для перезагрузки конфигурации
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'
# Хоткей для изменения конфигурации
bind e new-window -n "~/.tmux.conf" "EDITOR=\\\${EDITOR//nvim/vim} ~/.tmux.conf && tmux source ~/.tmux.conf && tmux display \\"~/.tmux.conf sourced\\""

# Сплит панелей горизонтально
bind _ split-window -v
# Сплит панелей вертикально
bind - split-window -h

# Переключение между панелей
bind -r j select-pane -D
bind -r k select-pane -U
bind -r h select-pane -L
bind -r l select-pane -R
# Переключение на следующую / предыдущую панель
bind > swap-pane -D
bind < swap-pane -U

# Ресайз панелей
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# Копирование и вставка
bind Enter copy-mode

# Скрытие статуса
bind-key h set -g status
EOF

	figlet "Configs"
	sleep 2

	# Собираем массив для конфигураций
	configurations=($(ls -d $CONFIG_DIR/*))

	# Перебираем весь список в массиве
	for i in "${configurations[@]}"
	do 

		echo $i

		# Линкуем весь список в $HOME/.config/
		ln -sf $i $HOME/.config/
	done
}

config
