@echo off
title Inventario Equipo

set carpeta=%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%

mkdir "%carpeta%"

set archivo=%carpeta%\Datos_%COMPUTERNAME%.txt

echo Generando inventario...

(
echo =====================================
echo INVENTARIO DEL EQUIPO
echo =====================================

echo.
echo Fecha:
date /t

echo.
echo Hora:
time /t

echo.
echo Nombre de equipo:
hostname

echo.
echo Marca y modelo:
wmic computersystem get manufacturer,model

echo.
echo Procesador y nucleos:
wmic cpu get name,NumberOfCores

echo.
echo Memoria RAM:
wmic computersystem get TotalPhysicalMemory

echo.
echo Sistema Operativo:
wmic os get Caption,Version,OSArchitecture

echo.
echo IPv4:
ipconfig

echo.
echo Tarjeta de red:
wmic nic where NetEnabled=true get Name

) > "%archivo%"

echo.
echo =====================================
echo INVENTARIO TERMINADO
echo =====================================

echo.
echo Carpeta creada:
echo %carpeta%

pause