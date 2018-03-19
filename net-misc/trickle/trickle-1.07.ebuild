# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="a portable lightweight userspace bandwidth shaper"
HOMEPAGE="http://monkey.org/~marius/pages/?page=trickle"
SRC_URI="http://monkey.org/~marius/trickle/trickle-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-libs/libevent"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/fix-crasher.patch
)

src_compile() {
	base_src_compile configure
	sed -i '/#define in_addr_t/ s:^://:' config.h
	emake -j1 || die "make failed"
}
