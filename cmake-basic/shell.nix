#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "basic-cmake-shell";

	packages = with pkgs; [
		cmake
		gcc
		gdb
		gnumake
    valgrind
	];

	shellHook = ''
    if [ -d "build" ]; then
      rm -rf build
    fi
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug -S . -B build
    cd build
  '';
}
