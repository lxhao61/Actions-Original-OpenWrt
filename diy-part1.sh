#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 查看所有标签
#git tag
# 切换到标签v22.03.6
#git checkout v22.03.6

# 回退源码
#git reset --hard f372b71 #等同于切换到标签v22.03.6

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 注释掉默认 packages 源
#sed -i 's/^\(.*packages\)/#&/' feeds.conf.default

# 添加 packages 源
#sed -i '$a src-git packages https://github.com/Lienol/openwrt-packages.git;22.03' feeds.conf.default

# 注释掉默认 luci 源
#sed -i 's/^\(.*luci\)/#&/' feeds.conf.default

# 添加 luci 源
#sed -i '$a src-git luci https://github.com/lxhao61/luci.git;openwrt-22.03' feeds.conf.default
#sed -i '$a src-git luci https://github.com/Lienol/openwrt-luci.git;22.03' feeds.conf.default
