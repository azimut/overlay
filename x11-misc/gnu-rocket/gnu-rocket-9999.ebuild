# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="sync-tracker"
HOMEPAGE="https://github.com/emoon/rocket"

EGIT_REPO_URI="https://github.com/emoon/rocket"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND=""

IUSE=""

src_compile(){
	tundra2 linux-gcc-release
}

src_install(){
	newbin t2-output/linux-gcc-release-default/editor gnu-rocket-editor || die
}
