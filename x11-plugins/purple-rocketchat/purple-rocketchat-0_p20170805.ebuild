# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Adds support for Rocket.Chat to libpurple clients."
HOMEPAGE="https://bitbucket.org/EionRobb/purple-rocketchat"

if [[ ${PV} == 9999 ]]; then
    inherit mercurial
    EHG_REPO_URI="https://bitbucket.org/EionRobb/purple-rocketchat"
else
	COMMIT_ID="fb8dcc649782"
	SRC_URI="https://bitbucket.org/EionRobb/purple-rocketchat/get/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/EionRobb-${PN}-${COMMIT_ID}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-text/discount
	dev-libs/glib
	dev-libs/json-glib
	net-im/pidgin"
DEPEND="${RDEPEND}"
