# Check if script name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <sketch>"
  exit 1
fi

SKETCH_PATH="$1"

# Optional: Set the board and port (edit as needed)
FQBN="esp32:esp32:featheresp32"
PORT="/dev/ttyUSB0"

# Compile and upload
arduino-cli board attach -p "$PORT" -b "$FQBN" "$SKETCH_PATH/$SKETCH_PATH.ino" 
arduino-cli compile --fqbn "$FQBN" "$SKETCH_PATH" --upload -p "$PORT"

if [ -d "$SKETCH_PATH/data" ]; then
	~/.arduino15/packages/esp32/tools/mkspiffs/0.2.3/mkspiffs \
					-c $SKETCH_PATH/data \
					-b 4096 \
					-p 256 \
					-s 0x160000 \
					spiffs.bin
	~/.arduino15/packages/esp32/tools/esptool_py/5.1.0/esptool \
					--chip esp32 \
					--port "$PORT" \
					--baud 921600 \
					write_flash 0x290000 spiffs.bin
fi
