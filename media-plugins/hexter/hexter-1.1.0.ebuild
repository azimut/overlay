# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

EGIT_REPO_URI="https://github.com/smbolton/hexter"
EGIT_COMMIT="version_${PV}"

DESCRIPTION="Yamaha DX7 modeling DSSI plugin"
HOMEPAGE="http://dssi.sourceforge.net/hexter.html"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk2 readline"

RESTRICT="mirror"

RDEPEND="media-libs/alsa-lib
	>=media-libs/dssi-0.4
	>=media-libs/liblo-0.12
	gtk2? ( x11-libs/gtk+:2 )
	readline? ( sys-libs/readline:0
		sys-libs/ncurses )"
DEPEND="${RDEPEND}
	media-libs/ladspa-sdk
	virtual/pkgconfig"

src_configure() {
	bash autogen.sh || die
	econf $(use_with gtk2) \
		$(use_with readline textui)
}

src_install() {
	emake DESTDIR="${D}" install
}
