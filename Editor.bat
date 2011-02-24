@echo off

REM #========================================================
REM #             Based on script
REM #      Developed by Raku (rakudayo@gmail.com)
REM #========================================================
REM # Use this batch file as you please.
REM #========================================================


REM #========================================================
REM #  Setup the Paths for the Importer/Exporter
REM #========================================================

REM # The path to the utility scripts relative to the project dir
SET SCRIPTS_DIR="Utility"

REM # The path to the project dir relative to the utility scripts
SET PROJECT_DIR=".."

REM #===============================
REM #  Change to Game Directory
REM #===============================

CD Game_Data

REM #===============================
REM #  Change to Scripts Directory
REM #===============================

SET PREV_DIR=%CD%
CD %SCRIPTS_DIR%

REM #========================
REM #  RGSS script Importer
REM #========================

script_importer.exe %PROJECT_DIR%

REM #======================
REM #  RMXP Data Importer
REM #======================

data_importer.exe %PROJECT_DIR%

REM #=======================
REM #  Start RPG Maker XP
REM #=======================

logtime.exe %PROJECT_DIR%

CD %PROJECT_DIR%

START /WAIT Game.rxproj

CD %SCRIPTS_DIR%

REM #======================
REM #  RMXP Data Exporter
REM #======================

data_exporter.exe %PROJECT_DIR%

REM #========================
REM #  RGSS Script Exporter
REM #========================

script_exporter.exe %PROJECT_DIR%

REM #================================
REM #  Return to Original Directory
REM #================================

CD %PREV_DIR%

CD ..