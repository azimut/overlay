# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

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
	sed -i '/#define in_addr_t/ s:^://:' config.h
	emake -j1 || die "make failed"
}
