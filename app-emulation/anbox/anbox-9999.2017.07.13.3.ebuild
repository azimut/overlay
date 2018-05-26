# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-2 systemd versionator udev linux-info

RESTRICT="mirror"

vc=($(get_all_version_components "${PV}"))
YEAR="${vc[2]}"
MONTH="${vc[4]}"
DAY="${vc[6]}"
IMG_REVISION="${vc[8]}"

DESCRIPTION="Anbox is a container-based approach to boot a full Android system on a regular GNU/Linux system"
HOMEPAGE="https://anbox.io"
EGIT_REPO_URI="https://github.com/anbox/anbox"
SRC_URI="http://build.anbox.io/android-images/${YEAR}/${MONTH}/${DAY}/android_${IMG_REVISION}_amd64.img"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/dbus-cpp
	app-emulation/lxc
"

S="${WORKDIR}"

CONFIG_CHECK="
	~ANDROID_BINDER_IPC
	~ASHMEM
	~NAMESPACES
	~IPC_NS
	~NET_NS
	~PID_NS
	~USER_NS
	~UTS_NS
	~BRIDGE
	~IP_NF_IPTABLES
	~IP_NF_MANGLE
	~IP_NF_NAT
	~NF_NAT_MASQUERADE_IPV4
	~NETFILTER_XT_MATCH_COMMENT
	~NETFILTER_XT_TARGET_CHECKSUM
"

pkg_setup() {
	linux-info_pkg_setup
}

src_prepare() {
	cmake-utils_src_prepare
	# Remove deprecated syntax from udev rule #
	sed -e 's: NAME="%k",::g' \
		-i kernel/99-anbox.rules
}

src_install() {
	cmake-utils_src_install

	# 'anbox-container-manager.service' is started as root #
	insinto $(systemd_get_systemunitdir)
	doins "${FILESDIR}/anbox-container-manager.service"
	doins "${FILESDIR}/anbox-session-manager.service"
	#use privileged && \
	#	sed -e 's:--daemon --data-path:--daemon --privileged --data-path:g' \
	#		-i $(systemd_get_systemunitdir)/anbox-container-manager.service
	dosym $(systemd_get_systemunitdir)/anbox-container-manager.service \
		$(systemd_get_systemunitdir)/default.target.wants/anbox-container-manager.service

	# 'anbox0' network interface #
	insinto $(systemd_get_utildir)/network
	doins "${FILESDIR}/80-anbox-bridge.network"
	doins "${FILESDIR}/80-anbox-bridge.netdev"
	dosym $(systemd_get_systemunitdir)/systemd-networkd.service \
		$(systemd_get_systemunitdir)/default.target.wants/systemd-networkd.service

	# 'anbox-launch' wrapper script to start 'session-manager' and anbox appmgr #
	exeinto /usr/bin
	doexe "${FILESDIR}/anbox-launch"

	# anbox.desktop and icon #
	insinto /usr/share/applications
	doins "${FILESDIR}/anbox.desktop"
	insinto /usr/share/pixmaps
	newins snap/gui/icon.png anbox.png

	insinto /var/lib/anbox
	newins "${DISTDIR}/android_${IMG_REVISION}_amd64.img" android.img

	udev_dorules kernel/99-anbox.rules
}
