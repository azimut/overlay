# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="BASS is an audio library for use in software on several platforms"
HOMEPAGE="http://www.un4seen.com/"
SRC_URI="http://www.un4seen.com/files/bass24-linux.zip"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~x86"
IUSE="doc"
RESTRICT="mirror strip"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

# Comes with a makefile to compile examples, not the lib.
src_compile() {
	:;
}

src_install() {
	insinto /usr/include
	doins bass.h

	dolib.so libbass.so
}
