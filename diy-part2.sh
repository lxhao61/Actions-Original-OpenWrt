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
#sed -i 's/192.168.1.1/192.168.6.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 删除lienol大自带xray-core核心
rm -rf package/feeds/packages/xray-core

# 拉取PassWall源码
git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/xiaorouji/packages
cd package/xiaorouji/packages
git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
cd -
#git clone -b packages https://github.com/lxhao61/openwrt-passwall.git package/xiaorouji/packages
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/xiaorouji/luci
#git clone -b luci https://github.com/lxhao61/openwrt-passwall.git package/xiaorouji/luci

# 删除原版softethervpn插件
#rm -rf feeds/packages/net/softethervpn

# 拉取Lean大softethervpn插件
#svn co https://github.com/coolsnowwolf/packages/trunk/net/softethervpn feeds/packages/net/softethervpn

# 删除原版softethervpn5插件
#rm -rf feeds/packages/net/softethervpn5

# 拉取Lean大softethervpn5插件
#svn co https://github.com/coolsnowwolf/packages/trunk/net/softethervpn5 feeds/packages/net/softethervpn5

# 删除原版luci-app-softethervpn插件
#rm -rf feeds/lienol/luci-app-softethervpn

# 拉取修改后的luci-app-softethervpn插件
#svn co https://github.com/lxhao61/openwrt-package/trunk/luci-app-softethervpn package/lienol/luci-app-softethervpn

# lean插件相关
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/lean/ipv6-helper
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-syncdial package/lean/luci-app-syncdial
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/lean/vlmcsd
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-guest-wifi package/lean/luci-app-guest-wifi

# lienol其它插件
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/ipsec-tools package/lienol/ipsec-tools
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/strongswan package/lienol/strongswan
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-ipsec-vpnserver-manyusers package/lienol/luci-app-ipsec-vpnserver-manyusers
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/lienol/smartdns
#svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns package/lienol/luci-app-smartdns
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-guest-wifi package/lienol/luci-app-guest-wifi
