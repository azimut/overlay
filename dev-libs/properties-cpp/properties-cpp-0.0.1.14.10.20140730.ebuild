# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils versionator

vc=($(get_all_version_components "${PV}"))
MAIN_PV="${vc[0]}${vc[1]}${vc[2]}${vc[3]}${vc[4]}"
OS_PV="${vc[6]}.${vc[8]}"
DAY_PV="${vc[10]}"

DESCRIPTION="A very simple convenience library for handling properties and signals in C++11"
HOMEPAGE="https://launchpad.net/properties-cpp"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${MAIN_PV}+${OS_PV}.${DAY_PV}.orig.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

RESTRICT="mirror"

DEPEND="
	dev-util/gcovr
	app-doc/doxygen
	dev-cpp/gtest
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAIN_PV}+${OS_PV}.${DAY_PV}"

src_prepare() {
	sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
	eapply_user

	eautoreconf
}
