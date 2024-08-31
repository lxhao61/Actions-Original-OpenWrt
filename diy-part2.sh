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

# 修改主机名
#sed -i "s/hostname='.*'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

# 修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/.*timezone='CST-8'.*/i\ set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

# 删除自带 golang
rm -rf feeds/packages/lang/golang
# 拉取 golang
git clone https://github.com/sbwml/packages_lang_golang.git -b 22.x feeds/packages/lang/golang

# 删除自带 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf package/feeds/luci/luci-app-passwall

# 拉取 luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci
#cd package/passwall/luci
#git checkout c62cdc51e470d3f0db668a2b8a201c7502c192fa
#cd -

# 拉取 ShadowSocksR Plus+
#git clone https://github.com/fw876/helloworld.git -b master package/helloworld

# 拉取 OpenAppFilter、luci-app-oaf
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 删除自带 chinadns-ng
#rm -rf feeds/packages/net/chinadns-ng
# 删除自带 hysteria
rm -rf feeds/packages/net/hysteria
# 删除自带 naiveproxy
#rm -rf feeds/packages/net/naiveproxy
# 删除自带 v2ray-geodata
rm -rf feeds/packages/net/v2ray-geodata
# 删除自带 xray-core
rm -rf feeds/packages/net/xray-core
# 删除自带 luci-app-softethervpn
rm -rf feeds/luci/applications/luci-app-softethervpn

# 筛选程序
function merge_package(){
    # 参数1是分支名,参数2是库地址。所有文件下载到指定路径。
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    trap 'rm -rf "$tmpdir"' EXIT
    branch="$1" curl="$2" target_dir="$3" && shift 3
    rootdir="$PWD"
    localdir="$target_dir"
    [ -d "$localdir" ] || mkdir -p "$localdir"
    tmpdir="$(mktemp -d)" || exit 1
    git clone -b "$branch" --depth 1 --filter=blob:none --sparse "$curl" "$tmpdir"
    cd "$tmpdir"
    git sparse-checkout init --cone
    git sparse-checkout set "$@"
    for folder in "$@"; do
        mv -f "$folder" "$rootdir/$localdir"
    done
    cd "$rootdir"
}
# 提取 chinadns-ng
#merge_package main https://github.com/xiaorouji/openwrt-passwall-packages.git feeds/packages/net chinadns-ng
# 提取 hysteria
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages.git feeds/packages/net hysteria
#merge_package v5 https://github.com/sbwml/openwrt_helloworld.git feeds/packages/net hysteria
# 提取 naiveproxy
#merge_package master https://github.com/immortalwrt/packages.git feeds/packages/net net/naiveproxy
#merge_package v5 https://github.com/sbwml/openwrt_helloworld.git feeds/packages/net naiveproxy
# 提取 v2ray-geodata
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages.git feeds/packages/net v2ray-geodata
# 提取 xray-core
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages.git feeds/packages/net xray-core
# 提取 luci-app-softethervpn
merge_package main https://github.com/kenzok8/small-package.git feeds/luci/applications luci-app-softethervpn
