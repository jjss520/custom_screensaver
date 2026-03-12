#!/bin/sh

mntroot rw

# 获取当前脚本所在的目录 (即 bin 目录本身)
BIN_DIR="$(cd "$(dirname "$0")" && pwd)"

# 恢复逻辑
if [ -L "/usr/share/blanket/screensaver" ]; then
    rm -f /usr/share/blanket/screensaver
else
    rm -rf /usr/share/blanket/screensaver
fi

if [ -d "/usr/share/blanket/screensaver.bak" ]; then
    mv /usr/share/blanket/screensaver.bak /usr/share/blanket/screensaver
else
    mkdir -p /usr/share/blanket/screensaver
fi

# ★ 核心改动：删除 bin 目录下的标志文件
rm -f "$BIN_DIR/status.flag"

eips -d l=fff,w=1200,h=220
eips 2 3 'Original screensaver restored!'

mntroot ro