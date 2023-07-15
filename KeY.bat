@ECHO OFF
color A
mode 60,15
title Hide Files...
if EXIST "systems" goto unlock 
if NOT EXIST locker goto Ancoder
:confirm
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
goto confirm
:LOCK
ren locker "systems"
attrib +h +r +s "systems"
goto End
:unlock
echo.
echo  ENTER PASSWORD:
echo.
set/p "pass=>  "
::Delete '0x00' and type your own password.
if NOT %pass%== 0x00 goto FAIL
attrib -h -r -s "systems"
ren "systems" locker
goto End
:FAIL
color 4
echo  INVALID PASSWORD
echo.
goto unlock
:Ancoder
md locker
goto End
:End