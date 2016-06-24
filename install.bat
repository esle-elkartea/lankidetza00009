@echo off
color 7C
title Instalador de K21 - AFONVI
echo 127.0.0.1	afonvi >> C:\WINDOWS\system32\drivers\etc\hosts
echo Iniciando la instalacion de K21 - AFONVI
echo.
pause
if exist k21.exe (
	copy k21.exe c:\
	c:\k21.exe
	del c:\k21.exe
	if exist k21.url (
		del k21.url
		echo [DEFAULT] >> K21-Aplicacion.url
		echo BASEURL= >> K21-Aplicacion.url
		echo [InternetShortcut] >> K21-Aplicacion.url
		echo URL=http://afonvi/ >> K21-Aplicacion.url
		echo IconIndex=0 >> K21-Aplicacion.url
		echo IconFile=c:\k21\k21.ico >> K21-Aplicacion.url
	) else (
		echo [DEFAULT] >> K21-Aplicacion.url
		echo BASEURL= >> K21-Aplicacion.url
		echo [InternetShortcut] >> K21-Aplicacion.url
		echo URL=http://afonvi/ >> K21-Aplicacion.url
		echo IconIndex=0 >> K21-Aplicacion.url
		echo IconFile=c:\k21\k21.ico >> K21-Aplicacion.url
	)
	if exist IR.url (
		del IR.url
		echo [DEFAULT] >> K21-Servidor.url
		echo BASEURL= >> K21-Servidor.url
		echo [InternetShortcut] >> K21-Servidor.url
		echo URL=file://C:\K21\IR.bat >> K21-Servidor.url
		echo IconIndex=0 >> K21-Servidor.url
		echo IconFile=C:\k21\k21.ico >> K21-Servidor.url
	) else (
		echo [DEFAULT] >> K21-Servidor.url
		echo BASEURL= >> K21-Servidor.url
		echo [InternetShortcut] >> K21-Servidor.url
		echo URL=file://C:\K21\IR.bat >> K21-Servidor.url
		echo IconIndex=0 >> K21-Servidor.url
		echo IconFile=C:\k21\k21.ico >> K21-Servidor.url
	)
	copy K21-Aplicacion.url "%ALLUSERSPROFILE%\Escritorio"
        mkdir "%ALLUSERSPROFILE%"\"Men£ Inicio"\"Programas"\"K21-AFONVI"
        copy K21-Aplicacion.url "%ALLUSERSPROFILE%\Men£ Inicio\Programas\K21-AFONVI"
	copy K21-Servidor.url "%ALLUSERSPROFILE%\Men£ Inicio\Programas\K21-AFONVI"
)else (
	echo No se ha encontrado el archivo k21.exe. Consulte con el administrador del sistema.
	goto error
)
echo.
echo.
echo Ahora iniciaremos la aplicacion por primera vez....
echo.
pause
start /b /min "Iniciando servidor" c:\k21\IR.bat
exit

:error
echo La instalacion termino con errores
pause
exit