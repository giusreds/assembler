#!/bin/sh
# dos.zip (original DOSBox environment)
src="http://docenti.ing.unipi.it/~a080368/Teaching/RetiLogiche/pdf/Ambienti/dos.zip"

echo "Downloading original DOSBox environment..."
curl --connect-timeout 2 -o "./dos.zip" $src 1>/dev/null 2>&1
if [ -f "./dos.zip" ]; then
    echo "Extracting..."
    unzip "./dos.zip" -d . 1>/dev/null
    # Remove old files
    rm -rf "./assembler/files/GAS" "./assembler/files/utility.s" "./assembler/demo"
    # Update GAS
    mv -f "./dos/files/GAS" "./assembler/files/GAS"
    # Update utility.s
    mv -f "./dos/files/utility.s" "./assembler/files/utility.s"
    # Update demo
    mv -f "./dos/demo" "./assembler/demo"
    # Cleanup
    rm -rf "./dos.zip" "./dos"
    echo "Done!"
else
    echo "Download failed"
fi