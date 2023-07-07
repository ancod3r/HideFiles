@ECHO OFF
color A
mode 60,15
title Hide Files...
if EXIST "System64" goto UNLOCK 
if NOT EXIST locker goto Ancoder
:CONFIRM
echo.
echo  ARE YOU SURE YOU WANT TO LOCK AND HIDE THE FOLDER (Y/N)
echo.
set/p "ancode=>  "
if %ancode%==Y goto LOCK
if %ancode%==y goto LOCK
if %ancode%==n goto END
if %ancode%==N goto END
echo.
echo  Invalid choice Type (Y for YES) (N for NO).
echo.
goto CONFIRM
:LOCK
ren locker "System64"
attrib +h +r +s "System64"
goto End
:UNLOCK
echo.
echo  ENTER PASSWORD:
echo.
set/p "pass=>  "
::remove '0x00' and create your own password and save it.
if NOT %pass%== 0x00 goto FAIL
attrib -h -r -s "System64"
ren "System64" locker
goto End
:FAIL
color 4
echo  INVALID PASSWORD
echo.
goto UNLOCK
:Ancoder
md locker
goto End
:End