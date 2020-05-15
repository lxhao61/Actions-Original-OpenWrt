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

# lean插件相关
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-syncdial package/lean/luci-app-syncdial
svn co https://github.com/Lienol/openwrt/trunk/package/lean/adbyby package/lean/adbyby
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/Lienol/openwrt/trunk/package/diy/frp package/lean/frp
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-frpc package/lean/luci-app-frpc
svn co https://github.com/Lienol/openwrt/trunk/package/lean/vlmcsd package/lean/vlmcsd
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/zerotier package/lean/zerotier
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-zerotier package/lean/luci-app-zerotier
svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
svn co https://github.com/Lienol/openwrt/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod

# lienol大passwall依赖插件相关
#svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/lienol/brook
#svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/lienol/chinadns-ng
#svn co https://github.com/Lienol/openwrt-package/trunk/package/dns2socks package/lienol/dns2socks
#svn co https://github.com/Lienol/openwrt-package/trunk/package/ipt2socks package/lienol/ipt2socks
svn co https://github.com/Lienol/openwrt-package/trunk/package/kcptun package/lienol/kcptun-client
#svn co https://github.com/Lienol/openwrt-package/trunk/package/openssl1.1 package/lienol/openssl1.1
#svn co https://github.com/Lienol/openwrt-package/trunk/package/pdnsd-alt package/lienol/pdnsd-alt
#svn co https://github.com/Lienol/openwrt-package/trunk/package/shadowsocksr-libev package/lienol/shadowsocksr-libev
#svn co https://github.com/Lienol/openwrt-package/trunk/package/simple-obfs package/lienol/simple-obfs
#svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/lienol/tcping
#svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan package/lienol/trojan
#svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray-plugin package/lienol/v2ray-plugin
#svn co https://github.com/Lienol/openwrt-package/trunk/package/v2ray package/lienol/v2ray

# lienol大passwall插件包
git clone https://github.com/kenzok8/openwrt-packages.git package/lienol/luci-app-passwall

# lienol其它插件
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/ipsec-tools package/lienol/ipsec-tools
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/strongswan package/lienol/strongswan
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-ipsec-vpnserver-manyusers package/lienol/luci-app-ipsec-vpnserver-manyusers
#svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-v2ray-server package/lienol/luci-app-v2ray-server
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/lienol/smartdns
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns package/lienol/luci-app-smartdns
svn co https://github.com/Lienol/openwrt/trunk/package/default-settings package/lienol/default-settings
