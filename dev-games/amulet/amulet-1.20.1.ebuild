# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils multilib flag-o-matic

DESCRIPTION="Amulet is a free Lua-based audio/visual toolkit suitable for small games and experimentation."
HOMEPAGE="http://www.amulet.xyz/"
SRC_URI="https://github.com/ianmaclarty/${PN}/archive/v${PV}.zip -> ${P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="mirror"

src_compile(){
	emake SDL_PREBUILT="" SDL_PREBUILT_DIR="/asda" builds/linux64/lua51/release/lib/libsdl.a || die # HACKS!
	emake SDL_PREBUILT="" SDL_PREBUILT_DIR="/asda" TARGET=linux64.release LUAVM=lua51 || die
}
