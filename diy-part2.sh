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

# 删除自带 v2ray-geodata
#rm -rf feeds/packages/net/v2ray-geodata
#rm -rf package/feeds/packages/v2ray-geodata

# 删除自带 xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# 拉取 passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
#cd package/passwall/packages
#git checkout fed70a5113b60c96d9c8182e40770f37c83d67ba
#cd -

# 拉取 luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci
#cd package/passwall/luci
#git checkout ebd3355bdf2fcaa9e0c43ec0704a8d9d8cf9f658
#cd -

# 拉取 ShadowSocksR Plus+
#git clone https://github.com/fw876/helloworld.git -b master package/helloworld

# 拉取 luci-app-socat
git clone https://github.com/chenmozhijin/luci-app-socat.git package/socat

# 删除自带 ddns-scripts
rm -rf feeds/packages/net/ddns-scripts
# 删除 passwall-packages 中 gn
rm -rf package/passwall/packages/gn
# 删除 passwall-packages 中 naiveproxy
rm -rf package/passwall/packages/naiveproxy
# 删除自带 tailscale
rm -rf feeds/packages/net/tailscale

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
# 提取 ddns-scripts
merge_package openwrt-23.05 https://github.com/immortalwrt/packages.git feeds/packages/net net/ddns-scripts
# 提取 gn
merge_package openwrt-23.05 https://github.com/immortalwrt/packages.git package/passwall/packages devel/gn
# 提取 naiveproxy
merge_package master https://github.com/immortalwrt/packages.git package/passwall/packages net/naiveproxy
# 提取 tailscale
merge_package openwrt-23.05 https://github.com/immortalwrt/packages.git feeds/packages/net net/tailscale
# 提取 luci-app-autotimeset
merge_package main https://github.com/kenzok8/small-package.git package/feeds/luci luci-app-autotimeset
# 提取 msd_lite
merge_package openwrt-23.05 https://github.com/immortalwrt/packages.git package/msd_lite net/msd_lite
# 提取 luci-app-msd_lite
merge_package main https://github.com/kenzok8/small-package.git package/msd_lite luci-app-msd_lite
# 提取 vlmcsd
merge_package other https://github.com/Lienol/openwrt-package package/feeds/packages lean/vlmcsd
# 提取 luci-app-vlmcsd
merge_package other https://github.com/lxhao61/openwrt-package package/feeds/luci lean/luci-app-vlmcsd
