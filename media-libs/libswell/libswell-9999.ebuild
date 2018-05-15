# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION=" Cockos abstraction layer support for Reaper"
HOMEPAGE="https://www.cockos.com/wdl/"
EGIT_REPO_URI="https://github.com/justinfrankel/WDL.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

IUSE=""

src_compile() {
    #econf --with-posix-regex
	cd WDL/swell
	make
}

src_install() {
    #emake DESTDIR="${D}" install

	mkdir -p ${D}/usr/local/lib/
	cp WDL/swell/libSwell.so ${D}/usr/local/lib/

    #dodoc FAQ NEWS README
}

