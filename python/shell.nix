#shell.nix
# If the executable is not main.py, change the Run command with :%s/main.py/<path-to-executable>, then delete .nix-bin/ before restarting this shell
# Or modify the Run command directly in .nix-bin/Run
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "python-shell";

  # These lines use nix-ld to help python's terrible packaging and distribution system to find it's damn dependencies on NixOS
  # https://www.crescentro.se/posts/python-nixos/
	NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc # libstdc++
    zlib # libz (for numpy)
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

	packages = with pkgs; [
		uv # uv init or uv init --lib to start project
	];

	shellHook = ''
		export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH

    if [ ! -d ".venv" ]; then
      uv venv
    fi

    if [ ! -d ".nix-bin" ]; then
      mkdir -p .nix-bin
      echo 'python3.13 main.py' >> .nix-bin/Run
      chmod +x .nix-bin/Run
    fi
    export PATH=$PWD/.nix-bin:$PATH
    
    source .venv/bin/activate
	'';
}
