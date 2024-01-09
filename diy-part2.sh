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

# 选择最新的稳定版本（切换分支）
git branch -a
git tag
git checkout v23.05.2

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 删除自带 xray-core 源码
#rm -rf feeds/packages/net/xray-core
#rm -rf package/feeds/packages/xray-core

# 拉取 PassWall 源码
#git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/feeds/packages/passwall
#git clone -b packages https://github.com/lxhao61/openwrt-passwall.git package/feeds/packages/passwall
#cd package/feeds/packages/passwall
#git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
#cd -
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#git clone -b luci https://github.com/lxhao61/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#cd package/feeds/luci/luci-app-passwall
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+ 源码
#git clone -b master https://github.com/fw876/helloworld.git package/feeds/helloworld

# 提取 fullconenat-nft 源码
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/utils/fullconenat-nft package/network/utils/fullconenat-nft

# 提取 fullconenat 源码
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/utils/fullconenat package/network/utils/fullconenat

# 拉取 luci-app-autoreboot 源码
#git clone https://github.com/liammazy-zz/app-autoreboot.git package/feeds/luci/luci-app-autoreboot
#svn co https://github.com/Lienol/openwrt-package/branches/other/lean/luci-app-autoreboot package/feeds/luci/luci-app-autoreboot

# 拉取 vlmcsd 源码
#svn co https://github.com/immortalwrt/packages/branches/openwrt-23.05/net/vlmcsd package/feeds/packages/vlmcsd
#svn co https://github.com/Lienol/openwrt-package/branches/other/lean/vlmcsd package/feeds/packages/vlmcsd

# 拉取 luci-app-vlmcsd 源码
#git clone https://github.com/zlg98/luci-app-vlmcsd.git package/feeds/luci/luci-app-vlmcsd
#svn co https://github.com/Lienol/openwrt-package/branches/other/lean/luci-app-vlmcsd package/feeds/luci/luci-app-vlmcsd

# 拉取 msd_lite 源码
#git clone https://github.com/ximiTech/msd_lite.git package/feeds/packages/msd_lite
#git clone https://github.com/ximiTech/luci-app-msd_lite.git package/feeds/luci/luci-app-msd_lite
