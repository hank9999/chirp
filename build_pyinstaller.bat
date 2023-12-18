@echo off
setlocal EnableDelayedExpansion

wsl bash -c "cd ./chirp/locale && ls && make clean && make"
wsl find chirp/locale/ -maxdepth 1 -type f -delete

FOR /F "tokens=* USEBACKQ" %%F IN (`git -C ..\uvk5-chirp-driver describe --tags --abbrev^=0`) DO (set NEW_VERSION=%%F)
set "i=1" & set "v1=%NEW_VERSION:.=" & set /A i+=1 & set /A "v!i!=%+1"
set NEW_VERSION=%v1%.%v2%
echo Building version: %NEW_VERSION%

wsl bash -c "sed -i 's/CHIRP_VERSION = ".*"/CHIRP_VERSION = "'"%NEW_VERSION%"'"/g' chirp/__init__.py"

pyinstaller --noconfirm --onefile --windowed --icon "chirp/share/chirp.ico" --name "CHIRP_egzumer" --hidden-import "wx" --hidden-import "wx._xml" --add-data "chirp/share;chirp/share/" --add-data "chirp/stock_configs;chirp/stock_configs/" --add-data "chirp/locale;chirp/locale/" --add-data "chirp/drivers;chirp/drivers/"  "chirpwx.py"
git clean chirp/locale -fx
git checkout chirp/locale