@echo off

REM #========================================================
REM #             Based on script
REM #      Developed by Raku (rakudayo@gmail.com)
REM #========================================================
REM # Use this batch file as you please.
REM #========================================================

REM #========================================================
REM #  Enter into game directory
REM #========================================================

CD Game

REM #========================================================
REM #  Setup the Paths for the Importer/Exporter
REM #========================================================

REM # The path to the utility scripts relative to the project dir
SET SCRIPTS_DIR="../Utility"

REM # The path to the project dir relative to the utility scripts
SET PROJECT_DIR=".."

REM # The path to the data dir relative to the Game folder
SET DATA_DIR="Data"

REM #===============================
REM #  Change to Scripts Directory
REM #===============================

SET PREV_DIR=%CD%
CD %SCRIPTS_DIR%

REM #========================
REM #  RGSS script Importer
REM #========================

rxdatav.exe script_importer %PROJECT_DIR%

REM #======================
REM #  RMXP Data Importer
REM #======================

rxdatav.exe data_importer %PROJECT_DIR%

REM #======================
REM #  Copy required files
REM #  to the Game folder
REM #======================

CD %PREV_DIR%

CD ..

COPY Src\Required\* Game\. /Y

REM #======================
REM #  Return to Game directory
REM #======================

CD %PREV_DIR%

REM #=======================
REM #  See if import was successful
REM #=======================

CD %DATA_DIR%

FOR /f %%n in ('DIR /b ^| FIND ".rxdata" /c') DO SET RXDATA_FILES=%%n

CD %PREV_DIR%

IF %RXDATA_FILES% GTR 1 (
  REM #=======================
  REM #  Start Game
  REM #=======================
  START Game.exe
) ELSE (
  ECHO.
  ECHO Unable to find imported files required.
  ECHO.
  ECHO Make sure that rxdatav.exe has not been blocked
  ECHO by antivirus or a similar application.
  ECHO.
  PAUSE
)
CD ..