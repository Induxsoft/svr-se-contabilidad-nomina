@echo EMPAQUETAR
@ECHO OFF

set a= %1
IF "%~1"=="" set a=.\

call create_dir.bat %a%

@echo COPIANDO SERVICIOS DE CONTABILIDAD .NET 5
copy ..\v10\src\induxsoft.SE.ERP.ServiciosContabilidad\bin\Debug\net5.0\*.dll %a%\devkron_handler\bin

@echo COPIANDO SERVICIOS DE NOMINA .NET 5
copy ..\v10\src\induxsoft.SE.RH.BackEnd_V40\bin\Debug\net5.0\*.dll %a%\devkron_handler\bin

@echo COPIANDO EL PROVEEDOR DE SERVICIOS .NET 5
copy ..\v10\src\server\induxsoft.RexBack.ServicesProvider\bin\Debug\net5.0\*.dll %a%\devkron_handler\bin

@echo COPIANDO COMPONENTES .NET FRAMEWORK
copy ..\v10\src\induxsoft.SE.ERP.ServiciosContabilidad\bin\Debug\*.dll %a%\iis_handler\bin
copy ..\v10\src\induxsoft.SE.RH.BackEnd_V40\bin\Debug\*.dll %a%\iis_handler\bin
copy ..\v10\src\server\induxsoft.RexBack.ServicesProvider\bin\*.dll %a%\iis_handler\bin
copy ..\v10\src\server\induxsoft.RexBack.ServicesProvider\Services.ashx %a%\iis_handler\bin

if exist %a%\dkl\svc-rpc-stp.dkl copy %a%\dkl\svc-rpc-stp.dkl %a%\devkron_handler\web

PAUSE

GOTO EOF

:ERROR1
ECHO NO SE ENCONTRÓ UN DIRECTORIO DE SALIDA
GOTO EOF

:EOF