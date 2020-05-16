#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# clash插件
git clone https://github.com/frainzy1477/luci-app-clash.git package/lienol/luci-app-clash

# lean插件相关
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-syncdial package/lean/luci-app-syncdial
svn co https://github.com/Lienol/openwrt/trunk/package/lean/adbyby package/lean/adbyby
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/Lienol/openwrt/trunk/package/diy/frp package/lean/frp
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-frpc package/lean/luci-app-frpc
svn co https://github.com/Lienol/openwrt/trunk/package/lean/vlmcsd package/lean/vlmcsd
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/Lienol/openwrt-packages/trunk/net/zerotier package/lean/zerotier
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-zerotier package/lean/luci-app-zerotier
svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod

# lienol其它插件
svn co https://github.com/Lienol/openwrt-packages/trunk/net/ipsec-tools package/lienol/ipsec-tools
svn co https://github.com/Lienol/openwrt-packages/trunk/net/strongswan package/lienol/strongswan
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-ipsec-vpnserver-manyusers package/lienol/luci-app-ipsec-vpnserver-manyusers
svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray package/lienol/v2ray
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-v2ray-server package/lienol/luci-app-v2ray-server
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/lienol/smartdns
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns package/lienol/luci-app-smartdns
