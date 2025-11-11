#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "pyqt-shell";

  # These lines use nix-ld to help python's terrible packaging and distribution system to find it's damn dependencies on NixOS
  # https://www.crescentro.se/posts/python-nixos/
	NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
		alsa-lib # libasound.so.2
		dbus # libdbus-1.so.3
		expat # libexpat.so.1
		fontconfig # libfontconfig.so.1
		freetype # libfreetype.so.6
		glib # libgthread-2.0.so.0
		krb5 # libgssapi_krb5.so.2
		libGL # libGL.so.1
		libudev0-shim # libudev.so.0
		libxkbcommon # libxkbcommon.so.0
		nss # libsmime3.so
		nspr # libplds4.so
    stdenv.cc.cc # libstdc++
		xorg.libX11 # libX11.so.6
		xorg.libxcb # libxcb.so.1
		xorg.libXcomposite # libXcomposite.so.1
		xorg.libXdamage # libXdamage.so.1
		xorg.libXext # libXext.so.6
		xorg.libXfixes # libXfixes.so.3
		xorg.libXrandr # libXrandr.so.2
		xorg.libXrender # libXrender.so.1
		xorg.libXtst # libXtst.so.6
		wayland # libwayland-client.so.0
    zlib # libz (for numpy)
	];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

  # uv init or uv init --lib or uv init --bare
  # uv add <package>
  # uv pip install -r requirements.txt
	packages = with pkgs; [
		uv 	
		qt5.full
  ];

	shellHook = ''
		export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
		export QT_DEBUG_PLUGINS=1
		export QT_QPA_PLATFORM=wayland

    if [ -d ".venv" ]; then
			rm -rf .venv
    fi
		uv venv
		uv pip install -r requirements.txt

    source .venv/bin/activate
	'';
}
