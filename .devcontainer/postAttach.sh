#!/bin/bash

# export DISPLAY=:0
ps=`ps aux | grep x11vnc | grep -v grep | wc -l`
if [ $ps -eq 0 ]; then # 対象プロセスが存在しない場合
    Xvfb :0 -screen 0 1400x900x24 &
    x11vnc -display :0 -forever -noxdamage > /dev/null 2>&1 &
    icewm-session &
fi
