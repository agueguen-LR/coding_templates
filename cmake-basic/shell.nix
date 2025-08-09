#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "basic-cmake-shell";

	packages = with pkgs; [
		cmake
		gcc
		gnumake
    valgrind
	];

	shellHook = ''
    if [ -d "build" ]; then
      rm -rf build
    fi
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B build
    cd build
  '';
}
