# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs git-r3

DESCRIPTION="Make pointer-driven interfaces easier and faster for users to operate"
HOMEPAGE="http://www.semicomplete.com/projects/keynav/"
EGIT_REPO_URI="https://github.com/jordansissel/keynav.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

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
	dobin keynav

	insinto /etc
	doins keynavrc
}
