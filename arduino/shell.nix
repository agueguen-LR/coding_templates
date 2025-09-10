#shell.nix
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "arduino-project";

	packages = with pkgs; [
		arduino-cli
		gcc
    valgrind
	];

	shellHook = ''
    if [ -d "build" ]; then
      rm -rf build
    fi
    arduino-cli sketch new src
		arduino-cli board list
		cd build
  '';
}
