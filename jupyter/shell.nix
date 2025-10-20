#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "jupyter-shell";

  # These lines use nix-ld to help python's terrible packaging and distribution system to find it's damn dependencies on NixOS
  # https://www.crescentro.se/posts/python-nixos/
	NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc # libstdc++
    zlib # libz (for numpy)
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

  # uv init or uv init --lib
  # uv add <package>
  # uv pip install -r requirements.txt
	packages = with pkgs; [
		jupyter
		uv 	
  ];

	shellHook = ''
		export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH

		uv venv
    source .venv/bin/activate
		uv init --bare
		uv pip install -r requirements.txt
		mkdir -p ~/.local/share/jupyter/runtime
		ipython kernel install --user --name=venv
		echo "jupytext <.ipynb> --to md"
		jupyter-notebook . --autoreload &
		trap "pkill -f jupyter-notebook" EXIT
	'';
}
