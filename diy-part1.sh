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
# 切换到标签 v23.05.3
git checkout v23.05.3

# 回退源码
#git reset --hard 1c26bcb #等同于切换到标签 v23.05.2

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 注释默认 packages
sed -i 's/^\(.*packages\)/#&/' feeds.conf.default
# 添加 Immortal 大 packages
sed -i '$a src-git packages https://github.com/immortalwrt/packages.git;openwrt-23.05' feeds.conf.default
#sed -i '$a src-git packages https://github.com/immortalwrt/packages.git^1820d9b' feeds.conf.default

# 注释默认 luci
sed -i 's/^\(.*luci\)/#&/' feeds.conf.default
# 添加 Immortal 大 luci
sed -i '$a src-git luci https://github.com/immortalwrt/luci.git;openwrt-23.05' feeds.conf.default
