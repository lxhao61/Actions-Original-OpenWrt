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

# kenzok8大整理的插件包（含lienol大的passwall与lean大的ssr-plus等）
#git clone https://github.com/kenzok8/openwrt-packages.git package/lienol

# lienol大的passwall插件及依赖
#svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/lienol/brook
#svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/lienol/chinadns-ng
#svn co https://github.com/Lienol/openwrt-package/trunk/package/openssl1.1 package/lienol/openssl1.1
#svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/lienol/tcping
#svn co https://github.com/Lienol/openwrt-package/trunk/package/dns2socks package/lienol/dns2socks
#svn co https://github.com/Lienol/openwrt-package/trunk/package/ipt2socks package/lienol/ipt2socks
#svn co https://github.com/Lienol/openwrt-package/trunk/package/pdnsd-alt package/lienol/pdnsd-alt
#svn co https://github.com/Lienol/openwrt-package/trunk/package/kcptun package/lienol/kcptun
#svn co https://github.com/Lienol/openwrt-package/trunk/package/shadowsocksr-libev package/lienol/shadowsocksr-libev
#svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray-plugin package/lienol/v2ray-plugin
#svn co https://github.com/Lienol/openwrt-package/trunk/package/simple-obfs package/lienol/simple-obfs
#svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray package/lienol/v2ray
#svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan package/lienol/trojan
#svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan-go package/lienol/trojan-go
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-passwall package/lienol/luci-app-passwall

# lienol其它插件
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/ipsec-tools package/lienol/ipsec-tools
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/strongswan package/lienol/strongswan
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-ipsec-vpnserver-manyusers package/lienol/luci-app-ipsec-vpnserver-manyusers
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/lienol/smartdns
#svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns package/lienol/luci-app-smartdns
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-guest-wifi package/lienol/luci-app-guest-wifi

# lean插件相关
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-syncdial package/lean/luci-app-syncdial
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/adbyby package/lean/adbyby
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
#svn co https://github.com/Lienol/openwrt/trunk/package/diy/frp package/lean/frp
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-frpc package/lean/luci-app-frpc
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/vlmcsd package/lean/vlmcsd
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/zerotier package/lean/zerotier
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-zerotier package/lean/luci-app-zerotier
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod
