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

# 删除自带 hysteria
rm -rf feeds/packages/net/hysteria
rm -rf package/feeds/packages/hysteria

# 删除自带 gn
rm -rf feeds/packages/devel/gn
rm -rf package/feeds/packages/gn

# 删除自带 v2ray-geodata
rm -rf feeds/packages/net/v2ray-geodata
rm -rf package/feeds/packages/v2ray-geodata

# 删除自带 xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# 删除自带 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf package/feeds/luci/luci-app-passwall

# 拉取 passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
#cd package/passwall/packages
#git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
#cd -

# 拉取 luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci-app-passwall
#cd package/passwall/luci-app-passwall
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+
#git clone -b master https://github.com/fw876/helloworld.git package/feeds/helloworld

# 拉取 immortalwrt openwrt-23.05
git clone -b openwrt-23.05 https://github.com/immortalwrt/immortalwrt.git iwrt23
# 提取 fullconenat-nft
cp -rf iwrt23/package/network/utils/fullconenat-nft package/network/utils/fullconenat-nft
# 提取 fullconenat
cp -rf iwrt23/package/network/utils/fullconenat package/network/utils/fullconenat
# 删除 immortalwrt openwrt-23.05
rm -rf iwrt23
