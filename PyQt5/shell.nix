#shell.nix
# If the executable is not main.py, change the Run command with :%s/main.py/<path-to-executable>, then delete .nix-bin/ before restarting this shell
# Or modify the Run command directly in .nix-bin/Run
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "pyqt-shell";

  # These lines use nix-ld to help python's terrible packaging and distribution system to find it's damn dependencies on NixOS
  # https://www.crescentro.se/posts/python-nixos/
	NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc # libstdc++
    zlib # libz (for numpy)
		glib # libgthread-2.0.so.0
		libGL # libGL.so.1
		fontconfig # libfontconfig.so.1
		freetype # libfreetype.so.6
		libxkbcommon # libxkbcommon.so.0
		dbus # libdbus-1.so.3
		xorg.libX11 # libX11.so.6
		wayland # libwayland-client.so.0
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

    if [ ! -d ".venv" ]; then
      uv venv
    fi

    source .venv/bin/activate
	'';
}
