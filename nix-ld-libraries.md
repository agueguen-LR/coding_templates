# NixLD Library Names

## A compilation of library names for dependencies that may be needed when using a python + uv + nix-ld shell

### Libraries I've encountered

```nix
alsa-lib # libasound.so.2
dbus # libdbus-1.so.3
expat # libexpat.so.1
fontconfig # libfontconfig.so.1
freetype # libfreetype.so.6
krb5 # libgssapi_krb5.so.2
glib # libgthread-2.0.so.0
libGL # libGL.so.1
libudev0-shim # libudev.so.0
libxkbcommon # libxkbcommon.so.0
nss # libsmime3.so
nspr # libplds4.so
stdenv.cc.cc # libstdc++
xorg.libxcb # libxcb.so.1
xorg.libXcomposite # libXcomposite.so.1
xorg.libXdamage # libXdamage.so.1
xorg.libXext # libXext.so.6
xorg.libXfixes # libXfixes.so.3
xorg.libXrandr # libXrandr.so.2
xorg.libXrender # libXrender.so.1
xorg.libXtst # libXtst.so.6
xorg.libX11 # libX11.so.6
wayland # libwayland-client.so.0
zlib # libz
```

### More libraries I haven't needed yet
> source: https://github.com/NixOS/nixpkgs/issues/354513#issue-2644319747

```nix
zstd
curl
openssl
attr
libssh
bzip2
libxml2
acl
libsodium
util-linux
xz
systemd
libva
pipewire
xorg.libxshmfence
xorg.libXxf86vm
libelf
gtk2
xorg.libXinerama
xorg.libXcursor
xorg.libXScrnSaver
xorg.libXi
xorg.libSM
xorg.libICE
gnome2.GConf
cups
libcap
SDL2
libusb1
dbus-glib
ffmpeg
gtk3
icu
libnotify
gsettings-desktop-schemas
xorg.libXt
xorg.libXmu
libogg
libvorbis
SDL
SDL2_image
glew110
libidn
tbb
flac
freeglut
libjpeg
libpng
libpng12
libsamplerate
libmikmod
libtheora
libtiff
pixman
speex
SDL_image
SDL_ttf
SDL_mixer
SDL2_ttf
SDL2_mixer
libappindicator-gtk2
libdbusmenu-gtk2
libindicator-gtk2
libcaca
libcanberra
libgcrypt
libvpx
librsvg
xorg.libXft
libvdpau
pango
cairo
atk
gdk-pixbuf
libdrm
mesa
stdenv.cc.cc.lib
pkgs.gcc-unwrapped.lib
fuse
e2fsprogs 
fribidi
librsvg
ibus
```
