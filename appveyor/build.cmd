@echo off
setlocal enableextensions enabledelayedexpansion
		set SDK_RUNNER=%SDK_CACHE%\phpsdk-vc15-x64.bat
		if not exist "!SDK_RUNNER!" (
			echo "!SDK_RUNNER!" doesn't exist
			exit /b 3
		)

		call !SDK_RUNNER! -t %APPVEYOR_BUILD_FOLDER%\appveyor\build_task.cmd

		if %errorlevel% neq 0 exit /b 3
endlocal