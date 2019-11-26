@ECHO OFF
color A
mode 60,15
title Hide Files
if EXIST "HTG Locker" goto UNLOCK 
if NOT EXIST LOCKER goto Annon

:CONFIRM
echo.
echo  ARE YOU SURE YOU WANT TO LOCK AND HIDE THE FOLDER (Y/N)
echo.
set/p "annon=>  "
if %annon%==Y goto LOCK
if %annon%==y goto LOCK
if %annon%==n goto END
if %annon%==N goto END
echo.
echo  Invalid choice Type (Y for YES) (N for NO).
echo.
goto CONFIRM

:LOCK
ren LOCKER "HTG Locker"
attrib +h +s "HTG Locker"
goto End

:UNLOCK
echo.
echo  ENTER PASSWORD:
echo.
set/p "pass=>  "
                                :: ↓↓↓YOUR PASSWORD HERE ↓ DELETE 1234 ENTER YOUR PASSWORD↓↓↓
                                :: FOR MORE INFORMATION READ "HOW TO" TEXT FILE
								if NOT %pass%== 1234 goto FAIL
attrib -h -s "HTG Locker"
ren "HTG Locker" LOCKER
goto End

:FAIL
color 4
echo  INVALID PASSWORD
echo.
goto UNLOCK

:Annon
md LOCKER
goto End
:End
