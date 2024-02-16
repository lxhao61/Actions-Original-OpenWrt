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

# 删除自带 autosamba
rm -rf feeds/other/lean/autosamba
rm -rf package/feeds/other/autosamba
# 删除自带 luci-app-samba
rm -rf feeds/luci/applications/luci-app-samba
rm -rf package/feeds/luci/luci-app-samba
# 删除自带 luci-app-turboacc
rm -rf feeds/other/lean/luci-app-turboacc
rm -rf package/feeds/other/luci-app-turboacc

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
git clone https://github.com/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang

# 删除自带 xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# 拉取 passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
cd package/passwall/packages
git checkout fed70a5113b60c96d9c8182e40770f37c83d67ba
cd -

# 拉取 luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci
#cd package/passwall/luci
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+
#git clone https://github.com/fw876/helloworld.git -b master package/helloworld

# 拉取 msd_lite、luci-app-msd_lite
git clone https://github.com/ximiTech/msd_lite.git package/msd_lite/msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git package/msd_lite/luci-app-msd_lite

# 拉取 OpenAppFilter、luci-app-oaf
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 删除自带 ddns-scripts
rm -rf feeds/packages/net/ddns-scripts
# 删除 passwall-packages 中 naiveproxy
#rm -rf package/passwall/packages/naiveproxy
# 删除自带 socat
rm -rf feeds/packages/net/socat
# 删除自带 luci-app-socat
rm -rf feeds/lienol/luci-app-socat
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
merge_package master https://github.com/immortalwrt/packages.git feeds/packages/net net/ddns-scripts
# 提取 naiveproxy
#merge_package master https://github.com/immortalwrt/packages.git package/passwall/packages net/naiveproxy
# 提取 socat
merge_package openwrt-22.03 https://github.com/openwrt/packages.git feeds/packages/net net/socat
# 提取 luci-app-socat
merge_package main https://github.com/chenmozhijin/luci-app-socat.git feeds/lienol luci-app-socat
# 提取 tailscale
merge_package master https://github.com/openwrt/packages.git feeds/packages/net net/tailscale
