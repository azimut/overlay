# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils versionator

vc=($(get_all_version_components "${PV}"))
MAIN_PV="${vc[0]}${vc[1]}${vc[2]}${vc[3]}${vc[4]}"
OS_PV="${vc[6]}.${vc[8]}"
DAY_PV="${vc[10]}"


#ewarn $(replace_version_separator 'p' '' "${OS_PV}")
#UURL="mirror://unity/pool/main/d/${PN}"
#UVER_PREFIX="+16.10.${PVR_MICRO}"

DESCRIPTION="Dbus-binding leveraging C++-11"
HOMEPAGE="http://launchpad.net/dbus-cpp"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${MAIN_PV}+${OS_PV}.${DAY_PV}.orig.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"
#RESTRICT="mirror"

DEPEND="dev-cpp/gtest
	dev-libs/boost:=
	dev-libs/process-cpp
	sys-apps/dbus"

S="${WORKDIR}"

src_prepare() {
	use doc || \
		sed -i '/add_subdirectory(doc)/d' CMakeLists.txt

	use examples || \
		sed -i '/add_subdirectory(examples)/d' CMakeLists.txt

	use test || \
		sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
	

	# Disable '-Werror' #
	sed -e 's/-Werror//g' \
		-i CMakeLists.txt
	cmake-utils_src_prepare
}
