# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs user

EGO_PN="github.com/42wim/matterbridge"

KEYWORDS=""

DESCRIPTION="Bridge between IRC and et all"
HOMEPAGE="https://github.com/42wim/matterbridge"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.8"

pkg_setup() {
	enewgroup $PN
	enewuser $PN -1 -1 -1 $PN
}

src_install() {
	default
	dobin matterbridge
}
