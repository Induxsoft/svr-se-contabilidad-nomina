@echo CREANDO CARPETAS
@ECHO OFF

IF "%~1"=="" GOTO ERROR1

if exist %1\iis_handler rmdir /S /Q %1\iis_handler
mkdir %1\iis_handler\bin

if exist %1\devkron_handler rmdir /S /Q %1\devkron_handler
mkdir %1\devkron_handler\bin
mkdir %1\devkron_handler\web

@echo CARPETAS CREADAS
GOTO EOF

:ERROR1
ECHO NO SE ENCONTRÓ UN DIRECTORIO DE SALIDA
GOTO EOF

:EOF