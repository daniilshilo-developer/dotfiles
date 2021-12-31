#!/usr/bin/env bash

VCONSOLE_FILE="/etc/vconsole.conf"

sudo touch $VCONSOLE_FILE
echo FONT=cyr-sun16 | sudo tee $VCONSOLE_FILE
echo KEYMAP=RU | sudo tee -a $VCONSOLE_FILE
