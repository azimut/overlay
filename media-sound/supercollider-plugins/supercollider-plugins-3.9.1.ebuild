# Copyright 1999-2016 Gentoo Foundation
# $Id$

EAPI=6

inherit cmake-utils eutils git-r3

DESCRIPTION="Third-party plugins provide additional synthesis, analysis, and other capabilities for the supercollider server."
HOMEPAGE="https://github.com/supercollider/sc3-plugins"

EGIT_REPO_URI="https://github.com/supercollider/sc3-plugins"
EGIT_COMMIT="Version-${PV}"
S="${WORKDIR}/supercollider-plugins-${PV}"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="native"

REQUIRED_USE=""

RDEPEND=">=media-sound/supercollider-3"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/find-supercollider-3.7.2.patch
	)


src_configure() {
	local mycmakeargs=(
		-Wno-dev
		-DSUPERNOVA=OFF
		-DNATIVE=$(usex native)
	)
	cmake-utils_src_configure 
}

src_install() {
	cmake-utils_src_install

	# Do not violate multilib strict
	# todo : needed ?
	#mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"

	#use emacs && newdoc editors/scel/README.md README.emacs
	#use gedit && newdoc editors/sced/README.md README.gedit
	#use vim && newdoc editors/scvim/README.md README.vim
}
pkg_postinst() {
	einfo
	einfo "Notice: Quarks extension can be installed if git is present"
	einfo "and running in SC this for example: 'Quarks.install(\"3Dj\")'"
	einfo "Alternatively you can download manually the quark repo and"
	einfo "add it into ~/.config/SuperCollider/sclang_conf.yaml"
	einfo "includePaths:"
	einfo "- /data/Dirt-Samples"
	einfo "excludePaths:"
	einfo "[]"
	einfo
}
