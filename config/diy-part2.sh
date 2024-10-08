# Modify some code adaptation
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$KVHNuqbv$4X2BPbtsXn2AApknHIn38.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# => alist
git clone https://github.com/sbwml/luci-app-alist package/new/alist
rm -rf package/new/alist/luci-app-alist
git clone https://github.com/sbwml/luci-app-alist package/new/alist/luci-app-alist -b lua --depth=1

# => 阿里ddns
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns

# => openclash
git clone https://github.com/vernesong/OpenClash.git --depth 1 package/openclash

# => 删除默认argon主题
rm -rf feeds/luci/themes/luci-theme-argon

#主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

