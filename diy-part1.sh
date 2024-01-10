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

# 选择最新的稳定版本（切换分支）
git branch -a
git tag
git checkout v23.05.2

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 注释掉默认 packages 源
sed -i 's/^\(.*packages\)/#&/' feeds.conf.default

# 注释掉默认 luci 源
sed -i 's/^\(.*luci\)/#&/' feeds.conf.default

# 添加 packages 源
#sed -i '$a src-git packages https://github.com/immortalwrt/packages.git;openwrt-23.05' feeds.conf.default
sed -i '$a src-git packages https://github.com/lxhao61/packages.git;openwrt-23.05' feeds.conf.default

# 添加 luci 源
sed -i '$a src-git luci https://github.com/immortalwrt/luci.git;openwrt-23.05' feeds.conf.default
