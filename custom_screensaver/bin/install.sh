#!/bin/sh

mntroot rw

# 获取当前脚本所在的目录 (即 bin 目录本身)
BIN_DIR="$(cd "$(dirname "$0")" && pwd)"

# 替换逻辑
if [ ! -L "/usr/share/blanket/screensaver" ]; then
    if [ ! -d "/usr/share/blanket/screensaver.bak" ]; then
        mv /usr/share/blanket/screensaver /usr/share/blanket/screensaver.bak
    else
        rm -rf /usr/share/blanket/screensaver
    fi
else
    rm -f /usr/share/blanket/screensaver
fi

mkdir -p /mnt/us/screensaver
ln -s /mnt/us/screensaver /usr/share/blanket/screensaver

# ★ 核心改动：在 bin 目录下生成标志文件
touch "$BIN_DIR/status.flag"

eips -d l=fff,w=1200,h=220
eips 2 3 'Custom screensaver enabled successfully!'

mntroot ro