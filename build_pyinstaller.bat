REM @echo off
REM setlocal EnableDelayedExpansion
REM
REM wsl bash -c "cd ./chirp/locale && ls && make clean && make"
REM wsl find chirp/locale/ -maxdepth 1 -type f -delete
REM
REM FOR /F "tokens=* USEBACKQ" %%F IN (`git -C ..\uvk5-chirp-driver describe --tags --abbrev^=0`) DO (set NEW_VERSION=%%F)
REM set "i=1" & set "v1=%NEW_VERSION:.=" & set /A i+=1 & set /A "v!i!=%+1"
REM set NEW_VERSION=%v1%.%v2%
REM echo Building version: %NEW_VERSION%
REM
REM wsl bash -c "sed -i 's/CHIRP_VERSION = ".*"/CHIRP_VERSION = "'"%NEW_VERSION%"'"/g' chirp/__init__.py"
REM
pyinstaller --noconfirm --onefile --windowed --icon "chirp/share/chirp.ico" --name "CHIRP_K5CN" --hidden-import "wx" --hidden-import "wx._xml" --add-data "chirp/share;chirp/share/" --add-data "chirp/stock_configs;chirp/stock_configs/" --add-data "chirp/locale;chirp/locale/" --add-data "chirp/drivers;chirp/drivers/" --add-data "%LOCALAPPDATA%/pypoetry/Cache/virtualenvs/chirp-QstY9Hzx-py3.8/Lib/site-packages/wx/locale/;wx/locale/" "chirpwx.py"
REM git clean chirp/locale -fx
REM git checkout chirp/locale