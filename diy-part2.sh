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

# 拉取 immortalwrt openwrt-23.05 源码
git clone -b openwrt-23.05 https://github.com/immortalwrt/immortalwrt.git iwrt23
# 提取 fullconenat-nft 源码
cp -rf iwrt23/package/network/utils/fullconenat-nft package/network/utils/fullconenat-nft
# 提取 fullconenat 源码
cp -rf iwrt23/package/network/utils/fullconenat package/network/utils/fullconenat
# 删除 immortalwrt openwrt-23.05 源码
rm -rf iwrt23
