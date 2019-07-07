#!/bin/sh

DIALOG_RESULT=$(echo -e 'shutdown\nhibernate\nreboot\nexit i3' | rofi -theme sidetab -dmenu -i -p "[Arch] : " -hide-scrollbar -tokenize -lines 4 -eh 1 -width 1920 -location 1 -padding 20 -disable-history -font "RobotoMono 15")
sleep 1;
if [ "$DIALOG_RESULT" = "exit i3" ];
then
    i3-msg 'exit'
elif [ "$DIALOG_RESULT" = "hibernate" ];
then
    exec systemctl hibernate
elif [ "$DIALOG_RESULT" = "reboot" ];
then
    exec reboot
elif [ "$DIALOG_RESULT" = "shutdown" ];
then
    exec shutdown -h now
fi