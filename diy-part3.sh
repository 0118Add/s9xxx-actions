#!/bin/bash
#===============================================
# Description: DIY script part 2
# File name: diy-part2.sh
# Lisence: MIT
# By: BGG
#===============================================


# 更换5.15内核
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/armvirt/Makefile

# 更改主机名
#sed -i "s/hostname='.*'/hostname='N1'/g" package/base-files/files/bin/config_generate

# autocore
sed -i 's/DEPENDS:=@(.*/DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_ipq807x||TARGET_mvebu||TARGET_rockchip||TARGET_armvirt) \\/g' package/lean/autocore/Makefile

# 修改概览里时间显示为中文数字
#sed -i 's/os.date()/os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X")/g' package/lean/autocore/files/arm/index.htm

# 设置密码为空
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
sed -i 's/"Argon 主题设置"/"主题设置"/g' package/luci-app-argon-config/po/zh-cn/argon-config.po
git clone https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/luci-theme-atmaterial_new
#rm -rf feeds/packages/lang/golang
#svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
#git clone https://github.com/sbwml/luci-app-alist.git package/alist
#sed -i 's/Alist 文件列表/网络云盘/g' package/alist/luci-app-alist/po/zh-cn/alist.po
git clone https://github.com/ophub/luci-app-amlogic.git package/amlogic
wget https://raw.githubusercontent.com/0118Add/patch/main/n1.sh
bash n1.sh

#luci-app-amlogic 晶晨宝盒
sed -i "s|https.*/s9xxx-openwrt|https://github.com/0118Add/N1dabao|g" package/amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|opt/kernel|https://github.com/breakings/OpenWrt/opt/kernel|g" package/amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|s9xxx_lede|g" package/amlogic/luci-app-amlogic/root/etc/config/amlogic

# 调整 Alist 文件列表 到 系统 菜单
#sed -i 's/nas/system/g' package/alist/luci-app-alist/luasrc/controller/*.lua
#sed -i 's/nas/system/g' package/alist/luci-app-alist/luasrc/model/cbi/alist/*.lua
#sed -i 's/nas/system/g' package/alist/luci-app-alist/luasrc/view/alist/*.htm
