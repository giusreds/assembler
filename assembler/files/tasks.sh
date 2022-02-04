#!/bin/sh
# Made by Giuseppe Rossi
srcname="ASSEMBLY"
start_dosbox="./files/dosbox.app/Contents/MacOS/DOSBox"
modded_s=$(echo "$2" | sed 's/\(.*\)\..*/\1/')
clear
# Remove MacOS warning message
xattr -dr com.apple.quarantine ./files/dosbox.app 1>/dev/null 2>&1
xattr -cr ./files/dosbox.app 1>/dev/null 2>&1
if [[ "$1" == "-r" || "$1" == "-d" ]]; then
    # Run or debug
    if [ -f "$2.exe" ]; then
        cp "$2.exe" ./$srcname.EXE 1>/dev/null 2>&1
        echo "Running \"$2.exe\" in DOSBox..."
        if [[ "$1" == "-r" ]]; then
            # Run
            $start_dosbox -c "@echo off" -c "MOUNT C ." -c "C:" -c "SET PATH=C:\files\GAS\BIN;%PATH%" -c "SET DJGPP=C:\files\GAS\DJGPP.ENV" -c "cls" -c "$srcname.EXE" -c "echo." -c "pause" -c "exit" 1>/dev/null 2>&1
        else
            # Debug
            $start_dosbox  -c "@echo off" -c "MOUNT C ." -c "C:" -c "SET PATH=C:\files\GAS\BIN;%PATH%" -c "SET DJGPP=C:\files\GAS\DJGPP.ENV" -c "cls" -c "gdb -x .\files\GAS\gdbstart $srcname.EXE" -c "exit" 1>/dev/null 2>&1
        fi
        rm -f ./$srcname.EXE 1>/dev/null 2>&1
        rm -f ./C*.LD ./C*.SWP ./C*.LE ./C*.O ./C*.C 1>/dev/null 2>&1
        clear
    else
        if [ -f "$2.s" ]; then
            echo "You have to assemble your code before running it."
        else
            echo "The current file is not a valid executable."
        fi
    fi
else
    if [[ "$1" == "-a" ]]; then
        # Assemble
        if [ -f "$2.s" ]; then
            cp "$2.s" ./$srcname.S 1>/dev/null 2>&1
            # Add new line at the end of the file
            echo -en "\n" >> ./$srcname.S 2>&1
            echo "Assembling \"$2.s\" in DOSBox..."
            $start_dosbox -c "@echo off" -c "MOUNT C ." -c "C:" -c "SET PATH=C:\files\GAS\BIN;%PATH%" -c "SET DJGPP=C:\files\GAS\DJGPP.ENV" -c "cls" -c "gcc -o $srcname.S -Wa,-a -Wa,--defsym,DOS=1 >NUL -g $srcname.S" -c "pause" -c "exit" 1>/dev/null 2>&1
            rm -f ./$srcname.S 1>/dev/null 2>&1
            mv -f ./$srcname.EXE "$2.exe" 1>/dev/null 2>&1
            rm -f ./C*.LD ./C*.SWP ./C*.LE ./C*.O ./C*.C 1>/dev/null 2>&1
            clear
        else
            echo "The current file is not a valid Assembly source file."
        fi
    else
        echo "Invalid parameter: \"$1\"."
    fi
fi