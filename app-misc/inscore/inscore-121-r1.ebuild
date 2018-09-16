# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="INScore - augmented interactive music scores"
HOMEPAGE="https://github.com/grame-cncm/"

SRC_URI="https://github.com/grame-cncm/inscore/archive/v${PV}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND="media-libs/guidoar
		 media-libs/guidolib
		 net-libs/libmicrohttpd
		 dev-qt/qtcore:5
		 dev-qt/qtwebsockets
video? ( media-plugins/gst-plugins-libav )"

IUSE="video"

S="${WORKDIR}/${P}/build/"

src_install(){
	mkdir -p ${D}/usr/$(get_libdir)
	mkdir -p ${D}/usr/bin
	emake INSTALLLIB=${D}/usr/$(get_libdir) \
		INSTALLBIN=${D}/usr/bin \
		DESTDIR="${D}" \
		PREFIX="${D}/usr" install
	einstalldocs
}
