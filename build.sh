#!/bin/sh
# Build assembler.zip
echo "Building the new Mac environment..."
zip -r "./assembler.zip" "./assembler" 1>/dev/null
echo "Done!"