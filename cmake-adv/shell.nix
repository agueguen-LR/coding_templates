#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "adv-cmake-shell";

	packages = with pkgs; [
    cmake
    clang-tools
    gcc
    gnumake
    flawfinder
    valgrind
    lcov
	];

	shellHook = ''
    if [ -d "build" ]; then
      rm -rf build
    fi
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DUSE_VALGRIND=1 -DBUILD_COVERAGE=1 -DBUILD_HTML_COVERAGE=1 -S . -B build
    cd build
	'';
}
