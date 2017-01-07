@echo on
setlocal enableextensions enabledelayedexpansion
	cd C:\projects

	wget http://windows.php.net/downloads/php-sdk/php-sdk-binary-tools-20110915.zip
	7z x -y php-sdk-binary-tools-20110915.zip -oC:\projects\php-sdk

	git clone -q --branch=PHP-%PHP_REL% https://github.com/php/php-src C:\projects\php-src

	mkdir C:\projects\php-src\ext\win32service
	xcopy C:\projects\win32service C:\projects\php-src\ext\win32service /s /e /y

	mkdir C:\projects\win32service\artifacts
	xcopy C:\projects\win32service\*.php C:\projects\win32service\artifacts /y

	for %%a in (%ARCHITECTURES%) do (
		set ARCH=%%a
		if "!ARCH!"=="amd64" set DEPTS_ARCH=x64
		if "!ARCH!"=="x86" set DEPTS_ARCH=x86

		call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall" !ARCH!
		call C:\projects\php-sdk\bin\phpsdk_setvars.bat

		wget http://windows.php.net/downloads/php-sdk/deps-%PHP_REL%-vc14-!DEPTS_ARCH!.7z
		7z x -y deps-%PHP_REL%-vc14-!DEPTS_ARCH!.7z -oC:\projects\php-src

		for %%z in (%ZTS_STATES%) do (
			set ZTS_STATE=%%z
			if "!ZTS_STATE!"=="enable" set ZTS_SHORT=ts
			if "!ZTS_STATE!"=="disable" set ZTS_SHORT=nts

			cd C:\projects\php-src
			call buildconf.bat
			call configure.bat --disable-all --with-mp=auto --enable-cli --!ZTS_STATE!-zts --enable-win32service=shared --with-config-file-scan-dir=C:\projects\win32service\build\modules.d --with-prefix=C:\projects\win32service\build --with-php-build=deps

			nmake
			nmake install

			cd %APPVEYOR_BUILD_FOLDER%
			move build\ext\php_win32service.dll artifacts\php_win32service-%PHP_REL%-vc14-!ZTS_SHORT!-!DEPTS_ARCH!.dll
		)
	)

goto end
	cd C:\projects

	wget http://windows.php.net/downloads/php-sdk/php-sdk-binary-tools-20110915.zip
	7z x -y php-sdk-binary-tools-20110915.zip -oC:\projects\php-sdk

	git clone -q --branch=PHP-%PHP_REL% https://github.com/php/php-src C:\projects\php-src

	mkdir C:\projects\php-src\ext\win32service
	xcopy C:\projects\win32service C:\projects\php-src\ext\win32service /s /e /y

	mkdir C:\projects\win32service\artifacts
	xcopy C:\projects\win32service\*.php C:\projects\win32service\artifacts /y
	set > C:\projects\win32service\artifacts\environment.txt

	for %%a in (%ARCHITECTURES%) do (
		set ARCH=%%a
		if "!ARCH!"=="amd64" set DEPTS_ARCH=x64
		if "!ARCH!"=="x86" set DEPTS_ARCH=x86

		call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall" !ARCH!
		call C:\projects\php-sdk\bin\phpsdk_setvars.bat

		wget http://windows.php.net/downloads/php-sdk/deps-%PHP_REL%-vc14-!DEPTS_ARCH!.7z
		7z x -y deps-%PHP_REL%-vc14-!DEPTS_ARCH!.7z -oC:\projects\php-src

		for %%z in (%ZTS_STATES%) do (
			set ZTS_STATE=%%z
			if "!ZTS_STATE!"=="enable" set ZTS_SHORT=ts
			if "!ZTS_STATE!"=="disable" set ZTS_SHORT=nts

			cd C:\projects\php-src
			call buildconf.bat

			call configure.bat --disable-all --with-mp=auto --enable-cli --!ZTS_STATE!-zts --enable-win32service=shared --with-config-file-scan-dir=C:\projects\win32service\build\modules.d --with-prefix=C:\projects\win32service\build --with-php-build=deps

			nmake
			nmake install

			move %APPVEYOR_BUILD_FOLDER%\build\ext\php_win32service.dll artifacts\php_win32service-%PHP_REL%-vc14-!ZTS_SHORT!-!DEPTS_ARCH!.dll
		)
	)

:end
endlocal