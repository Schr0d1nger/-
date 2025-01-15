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