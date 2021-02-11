cd "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\"
C:
del "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.map"
del "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.lst"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler\avrasm32.exe" -fI  -o "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.hex" -d "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.obj" -e "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.eep" -I "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly" -I "C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler\Appnotes" -w  -m "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\nim.map" "C:\Users\Aulia Rahman Zulfi\Documents\My Code\Assembly\NIM.asm"
