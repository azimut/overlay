# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="stdman is a tool that parses archived HTML files from cppreference and generates groff-formatted manual pages for Unix-based systems."
HOMEPAGE="https://github.com/jeaye/stdman"
EGIT_REPO_URI="https://github.com/jeaye/stdman"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
    emake DESTDIR="${D}" install
    dodoc LICENSE README.md
}
