# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A library providing a consistent way to browse and transform GMN."
HOMEPAGE="https://github.com/rocket/rocket"

SRC_URI="https://github.com/rocket/rocket/archive/v$PV.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND=""

IUSE=""

src_install(){
	newbin editor/editor rocket-editor || die
}
