@ECHO OFF
ECHO Searching for CBR and RAR files to recompress into CBZ (Comic Book Zip) archives.
for /r . %%F in (*.cbr *.rar *.zip *.7z) do (
ECHO Found %%F to recompress...
REM Extract...
"C:\Program Files\7-zip\7z" x "%%F" -o"%%F contents"
REM Does the directory exist? has 7zip created it correctly?
IF EXIST "%%F contents" (
REM Change directory, create zip of contents of directory...
CD "%%F contents"
REM cahnge name
ren 0.jpeg 00.jpeg
ren 1.jpeg 01.jpeg
ren 2.jpeg 02.jpeg
ren 3.jpeg 03.jpeg
ren 4.jpeg 04.jpeg
ren 5.jpeg 05.jpeg
ren 6.jpeg 06.jpeg
ren 7.jpeg 07.jpeg
ren 8.jpeg 08.jpeg
ren 9.jpeg 09.jpeg
REM remove banners 
DEL /F /S /Q z*.*
REM Delete Thumbnail files. 
DEL /F /S /Q Thumbs.db
REM compression level is 0, store only. 
"C:\Program Files\7-zip\7z" a -tzip "../%%~nF.cbz" * -mx=0
CD ..
REM Delete the temporary extraction folder
RMDIR "%%F contents" /S /Q
ECHO Recompressed %%F to %%~nF.zip
)
ECHO Search ended.
ECHO Delete originals
DEL /F /S /A /Q "%%F"
)
PAUSE
CLS
EXIT