# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp eutils

DESCRIPTION="SLIME, the Superior Lisp Interaction Mode (Extended)"
HOMEPAGE="http://common-lisp.net/project/slime/"
SRC_URI="https://github.com/slime/slime/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 xref? ( xref.lisp )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="xref"
RESTRICT=test # tests fail to contact sbcl

RDEPEND="virtual/commonlisp
	dev-lisp/asdf"
DEPEND="${RDEPEND}
	>=sys-apps/texinfo-5.1"

CLPACKAGE=swank
CLSYSTEMS=swank
SITEFILE=70${PN}-gentoo.el

src_prepare() {
	# Remove xref.lisp (which is non-free) unless USE flag is set
	use xref || rm -f xref.lisp

	default
}

src_compile() {
	emake compile contrib-compile
}

src_install() {
	## install core
	elisp-install ${PN} *.{el,elc,lisp} || die "Cannot install SLIME core"

	## install contribs
	elisp-install ${PN}/contrib/ contrib/*.{el,elc,lisp,scm,goo} \
		|| die "Cannot install contribs"

	## install lib
	elisp-install ${PN}/lib/ lib/*.{el,elc} || die "Cannot install libs"

	## install swank
	elisp-install ${PN}/swank/ swank/*.lisp || die "Cannot install swank"

	elisp-site-file-install "${FILESDIR}"/${SITEFILE} || die
}
