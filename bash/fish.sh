# #!/usr/bin/env bash

# Файл для установки fish
sudo apt install fish git

# Меняем шелл на fish
chsh -s /usr/bin/fish

# Установка oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf && exit
