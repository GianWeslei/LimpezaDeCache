@echo off

REM ******************** WINDOWS ********************

REM Apaga todas as pastas temporárias e arquivos temporários do usuário
takeown /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
icacls C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
md C:\Users\%USERNAME%\AppData\Local\Temp\

REM Apaga os arquivos de \Windows\Temp
takeown /A /R /D Y /F C:\windows\temp
icacls C:\windows\temp /grant administradores:F /T /C
rmdir /q /s c:\windows\temp
md c:\windows\temp

REM Apaga arquivos de log
del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\

REM ******************** FIREFOX ********************
taskkill /F /IM "firefox.exe"
REM define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q


taskkill /F /IM "chrome.exe"
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Profile 1\Cache\Cache_Data
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

set ChromeDir2=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Profile 2\Cache\Cache_Data
del /q /s /f "%ChromeDir2%"
rd /s /q "%ChromeDir2%"

set ChromeDir3=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Profile 3\Cache\Cache_Data
del /q /s /f "%ChromeDir3%"
rd /s /q "%ChromeDir3%"

set ChromeDir4=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Profile 4\Cache\Cache_Data
del /q /s /f "%ChromeDir4%"
rd /s /q "%ChromeDir4%"

set ChromeDir0=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data
del /q /s /f "%ChromeDir0%"
rd /s /q "%ChromeDir0%"

set ChromeDird=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Profile\Cache\Cache_Data
del /q /s /f "%ChromeDird%"
rd /s /q "%ChromeDird%"

                EDGE

taskkill /F /IM "msedge.exe"
set EdgeDir=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Profile 1\Cache\Cache_Data
del /q /s /f "%EdgeDir%"
rd /s /q "%EdgeDir%"

set EdgeDir1=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Profile 2\Cache\Cache_Data
del /q /s /f "%EdgeDir1%"
rd /s /q "%EdgeDir1%"

set EdgeDir2=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Profile 3\Cache\Cache_Data
del /q /s /f "%EdgeDir2%"
rd /s /q "%EdgeDir2%"

set EdgeDir0=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Profile\Cache\Cache_Data
del /q /s /f "%EdgeDir0%"
rd /s /q "%EdgeDir0%"

set EdgeDirs=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\Cache_Data
del /q /s /f "%EdgeDirs%"
rd /s /q "%EdgeDirs%"

set EdgeDir3=C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\data*
del /q /s /f "%EdgeDir3%"
rd /s /q "%EdgeDir3%"


exit
