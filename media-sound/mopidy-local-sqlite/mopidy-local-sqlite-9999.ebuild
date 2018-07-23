# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION=" Mopidy SQLite local library extension"
HOMEPAGE="https://github.com/mopidy/mopidy-local-sqlite"
EGIT_REPO_URI="https://github.com/mopidy/mopidy-local-sqlite/"
EGIT_BRANCH="master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-sound/mopidy
dev-python/uritools"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
