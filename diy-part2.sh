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

# 删除自带 golang 源码
rm -rf feeds/packages/lang/golang

# 拉取 golang 源码
git clone https://github.com/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang

# 删除自带 xray-core 源码
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# 拉取 passwall-packages 源码
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/feeds/packages/passwall
#cd package/feeds/packages/passwall
#git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
#cd -

# 拉取 luci-app-passwall 源码
git clone https://github.com/xiaorouji/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#cd package/feeds/luci/luci-app-passwall
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+ 源码
#git clone -b master https://github.com/fw876/helloworld.git package/helloworld

# 拉取 msd_lite 源码
git clone https://github.com/ximiTech/msd_lite.git package/feeds/packages/msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git package/feeds/luci/luci-app-msd_lite

# 拉取 phtunnel、pgyvpn 源码
#git clone https://github.com/OrayOS/OpenOray.git package/OpenOray

# 删除自带 tailscale 源码
rm -rf feeds/packages/net/tailscale
#rm -rf package/feeds/packages/tailscale

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
# 提取 tailscale 源码
merge_package main https://github.com/kenzok8/small-package feeds/packages/net/tailscale tailscale
