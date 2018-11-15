# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils git-r3

DESCRIPTION="unit-generator plugins for supercollider"
HOMEPAGE="https://github.com/redFrik/f0plugins"

EGIT_REPO_URI="https://github.com/redFrik/f0plugins"
EGIT_COMMIT="${PV}"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="native"

REQUIRED_USE=""

RDEPEND=">=media-sound/supercollider-3"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/find-supercollider-3.7.2.patch
	"${FILESDIR}"/custom.patch
	)

src_configure() {
	local mycmakeargs=(
		-DNATIVE=$(usex native)
		-DSC_PATH=/usr/include/SuperCollider
		-DINSTALL_DESTINATION=/usr/$(get_libdir)/SuperCollider/plugins/
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
