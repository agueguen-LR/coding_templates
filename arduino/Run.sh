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
