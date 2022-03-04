#!/bin/sh
# dos.zip (original DOSBox environment)
src="http://docenti.ing.unipi.it/~a080368/Teaching/RetiLogiche/pdf/Ambienti/dos.zip"

echo "Downloading original DOSBox environment..."

curl --connect-timeout 5 -o "./dos.zip" $src 1>/dev/null 2>&1

if [ -f "./dos.zip" ]; then
    echo "Building the new Mac environment..."

    unzip "./dos.zip" -d . 1>/dev/null

    # Move downloaded files to the new Mac environment
    rm -rf "./assembler/files/GAS" "./assembler/files/utility.s" "./assembler/demo"
    mv -f "./dos/files/GAS" "./assembler/files/GAS"
    mv -f "./dos/files/utility.s" "./assembler/files/utility.s"
    mv -f "./dos/demo" "./assembler/demo"

    # Build assembler.zip
    zip -r "./assembler.zip" "./assembler" 1>/dev/null 2>&1

    # Cleanup
    rm -rf "./dos.zip" "./dos"

    echo "Done!"
else
    echo "Download failed"
fi