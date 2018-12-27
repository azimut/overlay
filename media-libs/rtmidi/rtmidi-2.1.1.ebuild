# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit autotools eutils multilib

DESCRIPTION="provide a common C++ API for realtime MIDI input/output across ALSA n JACK"
HOMEPAGE="http://www.music.mcgill.ca/~gary/rtmidi/"
SRC_URI="https://github.com/thestk/${PN}/archive/${PV}.tar.gz"

LICENSE="Rt-Midi"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa +jack"
RDEPEND="alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
	$(use_with alsa) \
	$(use_with jack) || die "./configure failed"
}
