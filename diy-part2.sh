#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 删除自带 xray-core 源码
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# 拉取 PassWall 源码
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/feeds/packages/passwall
#git clone -b packages https://github.com/lxhao61/openwrt-passwall.git package/feeds/packages/passwall
#cd package/feeds/packages/passwall
#git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
#cd -
git clone https://github.com/xiaorouji/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#git clone -b luci https://github.com/lxhao61/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#cd package/feeds/luci/luci-app-passwall
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+ 源码
#git clone -b master https://github.com/fw876/helloworld.git package/feeds/helloworld

# 拉取 phtunnel、pgyvpn 源码
#git clone https://github.com/OrayOS/OpenOray.git package/feeds/OpenOray

# 提取 phtunnel 源码
#svn co https://github.com/coolsnowwolf/packages/trunk/net/phtunnel package/feeds/packages/phtunnel

# 提取 luci-app-phtunnel 源码
#svn co https://github.com/OrayOS/OpenOray/trunk/luci-app-phtunnel package/feeds/luci/luci-app-phtunnel

# 拉取 msd_lite 源码
git clone https://github.com/ximiTech/msd_lite.git package/feeds/packages/msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git package/feeds/luci/luci-app-msd_lite
