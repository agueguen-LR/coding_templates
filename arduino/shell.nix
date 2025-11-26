with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "arduino-project";

	packages = with pkgs; [
		arduino-cli
		clang-tools
		gcc
		python3
    valgrind
	];

	shellHook = ''
		arduino-cli config init
		arduino-cli config add board_manager.additional_urls https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
		arduino-cli core update-index
		arduino-cli config set network.connection_timeout 300s
		arduino-cli core install esp32:esp32@3.3.4
		git clone https://github.com/ESP32Async/AsyncTCP ~/.arduino15/packages/esp32/hardware/esp32/3.3.4/libraries/AsyncTCP
		git clone https://github.com/ESP32Async/ESPAsyncWebServer ~/.arduino15/packages/esp32/hardware/esp32/3.3.4/libraries/ESPAsyncWebServer
		git clone https://github.com/hmueller01/pubsubclient3 ~/.arduino15/packages/esp32/hardware/esp32/3.3.4/libraries/pubsubclient3
		
		sudo chmod a+rw /dev/ttyUSB0
		chmod +x Run.sh
		echo "To compile and upload: ./Run.sh <sketch>"
  '';
}
