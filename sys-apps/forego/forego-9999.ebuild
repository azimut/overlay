# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs user

EGO_PN="github.com/ddollar/forego"

KEYWORDS=""

DESCRIPTION="Manage Procfile-based applications, in Go"
HOMEPAGE="https://github.com/ddollar/forego"

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
	dobin forego
}
