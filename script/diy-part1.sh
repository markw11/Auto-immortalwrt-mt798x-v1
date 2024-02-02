#!/bin/bash
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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git diy https://github.com/CCnut/feed-netkeeper.git;LUCI-LUA-UCITRACK' feeds.conf.default

# Add a feed source
#rm -rf feeds/luci/applications/luci-app-passwall
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add luci-theme-argon
#cd lede/package/lean
#rm -rf luci-theme-argon 
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

cp -f defconfig/mt7981-ax3000.config .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_abt_asr3000=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_cetron_ct3003=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_cmcc_a10=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_cmcc_rax3000m-emmc=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_cmcc_rax3000m=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_h3c_nx30pro=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_imou_lc-hx3001=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_jcg_q30=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_konka_komi-a31=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_livinet_zr-3020=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_mt7981-360-t7-108M=y/d' .config
#sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_mt7981-clt-r30b1=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_xiaomi_mi-router-ax3000t=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_xiaomi_mi-router-ax3000t-stock=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_xiaomi_mi-router-wr30u-112m=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_xiaomi_mi-router-wr30u-stock=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_glinet_gl-mt2500=y/d' .config
sed -i '/CONFIG_TARGET_DEVICE_mediatek_mt7981_DEVICE_glinet_gl-mt3000=y/d' .config

sed -i '/CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NONE_V2RAY=y/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Client=y/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Server=y/d' .config

echo "CONFIG_PACKAGE_luci-app-smartdns=y" >> .config
echo "CONFIG_PACKAGE_curl=y" >> .config
echo "CONFIG_PACKAGE_htop=y" >> .config

