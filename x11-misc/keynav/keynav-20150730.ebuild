# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

myCommit="4ae486db6697877e84b66583a0502afc7301ba16"
DESCRIPTION="Make pointer-driven interfaces easier and faster for users to operate"
HOMEPAGE="http://www.semicomplete.com/projects/keynav/"
SRC_URI="https://github.com/jordansissel/keynav/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"

RDEPEND="x11-libs/cairo[X]
	x11-libs/libXinerama
	>=x11-misc/xdotool-3.20160804
	>=dev-libs/glib-2.0"
DEPEND="x11-base/xorg-proto
	${RDEPEND}"

src_prepare() {
	default

	sed -i 's/^[A-Z]\+FLAGS+=-pg -g$//' Makefile
}

src_compile() {
	tc-export CC LD

	default
}

src_install() {
	dodoc README CHANGELIST COPYRIGHT
	dobin keynav

	insinto /etc
	doins keynavrc
}
