# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit elisp

DESCRIPTION="Distributed Emacs Lisp for Erlang"
HOMEPAGE="https://code.google.com/p/distel/
        https://www.emacswiki.org/emacs/DistributedEmacsLisp"

if [[ ${PV} == "9999" ]] ; then
   inherit git-r3 #distutils-r1
   EGIT_REPO_URI="https://github.com/massemanet/distel.git"
   EGIT_BRANCH="2018"
   EGIT_COMMIT="23ea095eae52e3c88b3cb89d3a40f7dc8979661b"
else 
     SRC_URI="https://github.com/massemanet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

fi


# "New BSD License" according to https://code.google.com/p/distel/
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=">=dev-lang/erlang-11.2.5[emacs]"
RDEPEND="${DEPEND}"

SITEFILE="50${PN}-gentoo.el"

src_compile() {
        emake base info
        cd elisp || die
        elisp-compile *.el
}

src_install() {
        emake prefix="${ED}"/usr \
                ELISP_DIR="${ED}${SITELISP}/${PN}" install
        elisp-site-file-install "${FILESDIR}/${SITEFILE}"
        doinfo doc/distel.info
        dohtml doc/distel/*.html
        dodoc AUTHORS ChangeLog NEWS README*
        use doc && dodoc doc/gorrie02distel.pdf
}
