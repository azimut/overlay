# Overlay
## Raison d'être
* dev-python/pytesseract: not on portage, 9999 version found online converted to a versioned one.
* dev-python/scrapyd: missing on portage though the client is there. Seems simple enough (jinx).
* games-board/stockfish: install [fork](https://github.com/ddugovic/Stockfish) with support for variants from git
* media-sound/supercollider: Disable supernova, try to disable HID, patch for headless[#1209](https://github.com/supercollider/supercollider/issues/1209) and headless cpu bug[#2144](https://github.com/supercollider/supercollider/issues/2144)
* media-sound/supercollider-plugins: fix inconsistent release tarballs[#134](https://github.com/supercollider/sc3-plugins/issues/134) by using git-r3 
* net-misc/trickle: missing on portage, ebuild took from gentoo-htpc, fixed SRC\_URL and added ArchLinux patch.
* x11-apps/purple-discord: not on portage, live ebuild from [#618688](https://bugs.gentoo.org/618688) same of repo
* x11-apps/purple-rocketchat: not on portage
* x11-misc/keynav: never got into the official portage[#294727](https://bugs.gentoo.org/294727) and development is kind of stalled so no active maintenence might be needed for me (ebuild took from wreathe-overlay)
