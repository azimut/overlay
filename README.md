# Overlay
## Raison d'être
* app-emacs/slime: official gentoo portage version is out of date[#611780](https://bugs.gentoo.org/611780) and didn't work for me
* media-libs/sdl-ttf: needed for cl-sdl2-ttf
* media-sound/supercollider: Disable supernova, try to disable HID, patch for headless[#1209](https://github.com/supercollider/supercollider/issues/1209) and headless cpu bug[#2144](https://github.com/supercollider/supercollider/issues/2144)
* media-sound/supercollider-plugins: fix inconsistent release tarballs[#134](https://github.com/supercollider/sc3-plugins/issues/134) by using git-r3 
* x11-misc/keynav: never got into the official portage[https://bugs.gentoo.org/294727](#294727) and development is kind of stalled so no active maintenence might be needed for me (ebuild took from wreathe-overlay)
