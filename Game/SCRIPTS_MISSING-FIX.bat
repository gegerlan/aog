@ECHO OFF
IF EXIST .\Data\Scripts.rxdata (
  ECHO -
  ECHO - You should be good to go, contact a developer if the error
  ECHO - persists.
  ECHO - 
  ECHO - Please consult the README for further help and contact 
  ECHO - information.
  ECHO - 
) ELSE (
  ECHO -
  ECHO - You need to run the Game.bat file in the parent folder to 
  ECHO - generate all the required files.
  ECHO - 
  ECHO - I will do so now, but please, remember to read the README 
  ECHO - file, it is there for a reason.
  ECHO -

  IF EXIST ..\Game.bat (
    PUSHD ..
    START Game.bat
    POPD
  ) ELSE (
    IF EXIST ..\Utility (
      PUSHD ..\Utility

      IF EXIST Import.bat (
        START Import.bat
      ) ELSE (
        IF EXIST rxdatav.exe (
          START rxdatav.exe script_importer ..
          START rxdatav.exe data_importer ..
        ) ELSE (
          GOTO missing-utils
        )
      )

      POPD
    ) ELSE (
      :missing-utils
      ECHO - Conversion utilities are missing or corrupt.
      ECHO - 
      ECHO - Make sure everything has been extracted and try redownloading
      ECHO - the project.
      ECHO -
      ECHO - Please see the README for further information.
      ECHO -    
    )
  )
)
PAUSE