# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Note: tundra is a mess to install...it relies on a submodule, but does
# not provide it on the release. So git-r3 should do it...but there is some
# weird logic on the Makefile for the "branch" and only the branch that
# breaks if not in master.

EAPI=6

inherit git-r3

DESCRIPTION="A library providing a consistent way to browse and transform GMN."
HOMEPAGE="https://github.com/deplinenoise/tundra"

EGIT_REPO_URI="https://github.com/deplinenoise/tundra"
EGIT_BRANCH="master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~sparc ~x86"

DEPEND=""
RDEPEND=""

IUSE=""

src_compile(){
	emake NO_GIT_FILE=1 all || die
}
