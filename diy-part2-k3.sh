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

# 特殊的替换配置
## 删除自带的 ddns-scripts
rm -rf feeds/packages/net/ddns-scripts
## 删除自带的 lib
rm -rf target/linux/bcm53xx/base-files/lib
## 删除自带的 tailscale
rm -rf feeds/packages/net/tailscale
## 删除自带的 luci-base
rm -rf feeds/luci/modules/luci-base
## 删除自带的 luci-app-firewall
rm -rf feeds/luci/applications/luci-app-firewall
## 筛选程序
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
## 提取 brcmfmac-firmware-4366c0-pcie-k3
merge_package openwrt-25.12 https://github.com/immortalwrt/immortalwrt.git package/chajian/k3buding package/firmware/brcmfmac4366c0-firmware-k3
## 提取 ddns-scripts
merge_package openwrt-25.12 https://github.com/immortalwrt/packages.git feeds/packages/net net/ddns-scripts
## 提取 fullconenat-nft
merge_package openwrt-25.12 https://github.com/immortalwrt/immortalwrt.git package/network/utils package/network/utils/fullconenat-nft
## 提取 pdnsd-alt、upx
merge_package main https://github.com/kenzok8/jell.git package/chajian/kenzok8-package pdnsd-alt upx
## 提取 lib（修复更新固件配置丢失）
merge_package main https://github.com/openwrt/openwrt.git target/linux/bcm53xx/base-files target/linux/bcm53xx/base-files/lib
## 提取 tailscale（兼容如下 golang 27.x）
merge_package master https://github.com/openwrt/packages.git feeds/packages/net net/tailscale
## 提取 luci-base（如上 fullconenat-nft 需要）
merge_package openwrt-25.12 https://github.com/immortalwrt/luci.git feeds/luci/modules modules/luci-base
## 提取 luci-app-firewall（如上 fullconenat-nft 需要）
merge_package openwrt-25.12 https://github.com/immortalwrt/luci.git feeds/luci/applications applications/luci-app-firewall

# 删除自带的 golang
rm -rf feeds/packages/lang/golang
# 拉取新的 golang（如下 xray-core 等需要）
git clone https://github.com/sbwml/packages_lang_golang.git -b 27.x feeds/packages/lang/golang

# 删除自带的 passwall 核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,v2ray-plugin,xray-plugin,geoview,shadow-tls}
rm -rf package/feeds/packages/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,v2ray-plugin,xray-plugin,geoview,shadow-tls}
# 拉取新的 passwall 核心库
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/chajian/passwall-packages
#cd package/chajian/passwall-packages
#git checkout bc40fceb0488dfb5a4adb711cc1830a8021ee555
#cd -

# 拉取 luci-app-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall.git package/chajian/passwall-luci
#cd package/chajian/passwall-luci
#git checkout ebd3355bdf2fcaa9e0c43ec0704a8d9d8cf9f658
#cd -

# 拉取 easytier、luci-app-easytier
git clone https://github.com/EasyTier/luci-app-easytier.git package/chajian/easytier

# 删除自带的 k3screenctrl
rm -rf feeds/lienol/other/lean/k3screenctrl
rm -rf package/feeds/lienol/k3screenctrl
# 拉取新的 k3screenctrl
git clone https://github.com/yangxu52/k3screenctrl_build.git package/chajian/k3buding/k3screenctrl

# 拉取 luci-app-k3screenctrl
git clone https://github.com/yangxu52/luci-app-k3screenctrl.git package/chajian/k3buding/luci-app-k3screenctrl

# 拉取锐捷认证
git clone https://github.com/sbwml/luci-app-mentohust.git package/chajian/mentohust

# 拉取 msd_lite、luci-app-msd_lite
git clone https://github.com/gtolog/openwrt-msd_lite.git package/chajian/msd_lite

# 拉取 OpenAppFilter、luci-app-oaf
git clone https://github.com/destan19/OpenAppFilter.git package/chajian/OpenAppFilter

## 删除自带的 luci-app-socat
rm -rf feeds/lienol/luci-app-socat
rm -rf package/feeds/lienol/luci-app-socat
# 拉取新的 luci-app-socat
git clone https://github.com/chenmozhijin/luci-app-socat.git package/chajian/socat

# 替换 tailscale 的默认启动脚本和配置
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
# 拉取 luci-app-tailscale
git clone https://github.com/asvow/luci-app-tailscale.git package/chajian/tailscale/luci-app-tailscale

# 拉取 luci-app-temp-status
git clone https://github.com/Palatis/luci-app-temp-status.git package/chajian/status/luci-app-temp-status

# 拉取 luci-theme-argon
#git clone https://github.com/jerrykuku/luci-theme-argon.git -b master package/chajian/argon/luci-theme-argon
# 拉取 luci-app-argon-config
#git clone https://github.com/jerrykuku/luci-app-argon-config.git -b master package/chajian/argon/luci-app-argon-config
# 拉取 luci-theme-argon、luci-app-argon-config
git clone https://github.com/sbwml/luci-theme-argon.git -b openwrt-25.12-legacy package/chajian/argon

# 删除 feeds.conf.default 中添加的第三方源
sed -i '/lienol/d' feeds.conf.default

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci-light/Makefile

# 修改主机名
sed -i "s/hostname='.*'/hostname='K3'/g" package/base-files/files/bin/config_generate

# 修改默认时区
## 创建 uci-defaults 脚本
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/99-timezone << 'EOF'
#!/bin/sh
uci set system.@system[0].timezone='CST-8'
uci set system.@system[0].zonename='Asia/Shanghai'
uci commit system
EOF
chmod +x files/etc/uci-defaults/99-timezone

# 开启 WiFi
sed -i 's/disabled=.*/disabled=0/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc
#sed -i 's/ssid=.*/ssid=OpenWrt/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc
