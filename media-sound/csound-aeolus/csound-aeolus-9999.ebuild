# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils git-r3

DESCRIPTION="Fons Adriaensen's Aeolus software organ for Csound"
HOMEPAGE="https://github.com/gogins/csound-aeolus"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI=" https://github.com/gogins/csound-aeolus"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/gogins/csound-aeolus/releases/download/v${PV}/csound-aeolus-${PV}-Linux.tar.gz"
fi

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="double-precision"
REQUIRED_USE=""

RDEPEND="
media-sound/csound[double-precision=]
media-sound/aeolus"

DEPEND="${RDEPEND}"

src_configure() {
	# NOTE: pdf is not in the repo
	sed -i -e 's#.pdf#.tex#' CMakeLists.txt
	# NOTE: Gentoo install path is less verbose
	sed -i -e 's#/plugins64-${APIVERSION}#/plugins64#' CMakeLists.txt
	local mycmakeargs=(
		-DUSE_DOUBLE=$(usex double-precision)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
