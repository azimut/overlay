# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
DESCRIPTION="Library for blob detection"
HOMEPAGE="https://code.google.com/p/cvblob"
SRC_URI="https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/cvblob/source-archive.zip"
LICENSE="LGPL-2.1"
KEYWORDS="~x86"
SLOT=0
IUSE="+doc +examples test"

inherit eutils cmake-utils

RDEPEND=""

S="${WORKDIR}/${PN}"

DEPEND="doc? ( app-doc/doxygen virtual/latex-base )
$RDEPEND"

src_configure(){
	sed -i 's# lib# '$(get_libdir)'#g' cvBlob/CMakeLists.txt
	#sed -i 's#/lib#/'$(get_libdir)'#g' CMakeLists.txt
	#sed -i 's#lib)#'$(get_libdir)')#g' CMakeLists.txt
	#sed -i 's#lib/#'$(get_libdir)'/#g' CMakeLists.txt
	cmake-utils_src_configure
}
