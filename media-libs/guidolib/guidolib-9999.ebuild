# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A library providing a consistent way to browse and transform GMN."
HOMEPAGE="https://github.com/grame-cncm/"

EGIT_REPO_URI="https://github.com/grame-cncm/guidolib"
EGIT_BRANCH="dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND=""

IUSE=""

S="${S}/build/"

src_configure(){
	# sed -e "/LIBRARY DESTINATION/ s/lib/$(get_libdir)/g" \
		# 	-i CMakeLists.txt || die
	# sed -e "/LIBDIR / s/lib/$(get_libdir)/g" \
		# 	-i CMakeLists.txt || die
	# sed -e "/ARCHIVE DESTINATION/ s/lib/$(get_libdir)/g" \
		# 	-i CMakeLists.txt || die
	cmake-utils_src_configure
}
src_install(){
	dolib.so lib/libGUIDOEngine* || die
	cmake-utils_src_install
}
