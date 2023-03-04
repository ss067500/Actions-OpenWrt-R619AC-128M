##!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
rm -rf package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

git clone https://github.com/kenzok8/small.git package/small
git clone https://github.com/open-mesh-mirror/batman-adv.git package/batman-adv

# Add a feed source
#sed -i "/helloworld/d" "feeds.conf.default"
echo 'src-git helloworld https://github.com/fw876/helloworld.git'>> feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default
echo 'src-git kenzok https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >> feeds.conf.default
#sed -i '$a src-git Aibx https://github.com/Aibx/openwrt-packages' feeds.conf.default

#Add DDNSTO
echo >> feeds.conf.default
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
