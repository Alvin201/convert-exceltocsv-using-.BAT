::comma to pipe delimiter
@echo off
    setlocal enableextensions enabledelayedexpansion

    (for %%i in (*.csv) do (

        (for /f "tokens=*" %%f in (%%~i) do if not "%%f"=="" (
                set "line=%%f"
                set "line=!line:,=|!"
                echo !line! 
        )) > %%~ni_pipe.csv
    ))

    endlocal

::Delete
DEL /Q /F /S "*_modify.csv

::rename
@echo off
Setlocal enabledelayedexpansion
Set "Pattern=_modify_pipe"
Set "Replace="

For %%a in (*.csv) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

::create folder
set date="%date:~7,2%-%date:~4,2%-%date:~10,4%"
mkdir %date%
move C:\Users\chels\Desktop\tes\*.csv %date%
Pause&Exit
