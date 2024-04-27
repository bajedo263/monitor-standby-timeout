@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
color 08

:menu
cls
echo Choisissez le mode de gestion de l'alimentation :
echo 1. Mode Normal
echo 2. Mode Film
echo 3. Quitter

if "%choix%"=="" (
echo Mode actuel : Normal
) 	else if "%choix%"=="1" (
echo Mode actuel : Normal
) 	else if "%choix%"=="2" (
echo Mode actuel : Film
)

set /p choix="Votre choix : "

if "%choix%"=="1" (
    call :mode_normal
) else if "%choix%"=="2" (
    call :mode_film
) else if "%choix%"=="3" (
powercfg /change monitor-timeout-ac 3
powercfg /change standby-timeout-ac 5
powercfg /change monitor-timeout-dc 3
powercfg /change standby-timeout-dc 5
echo Mode normal activé.
    exit
) else (
    echo Choix invalide. Veuillez choisir une option valide.
    goto :menu
)

:mode_normal
powercfg /change monitor-timeout-ac 3
powercfg /change standby-timeout-ac 5
powercfg /change monitor-timeout-dc 3
powercfg /change standby-timeout-dc 5
echo Mode normal activé.
goto :menu

:mode_film
powercfg /change monitor-timeout-ac 120
powercfg /change standby-timeout-ac 120
powercfg /change monitor-timeout-dc 120
powercfg /change standby-timeout-dc 120
echo Mode film activé.
goto :menu
