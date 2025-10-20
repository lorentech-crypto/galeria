@echo off
REM ============================================================
REM Script para Windows: Angular 21+ + GitHub Pages deploy
REM ============================================================

echo Limpiando dependencias antiguas...
rmdir /s /q node_modules
del package-lock.json

echo Instalando Angular CLI y Angular 21+...
npm install @angular/cli@latest @angular/core@latest @angular-devkit/build-angular@latest --save-dev --legacy-peer-deps

echo Instalando TypeScript compatible...
npm install typescript@latest --save-dev --legacy-peer-deps

echo Instalando todas las dependencias del proyecto...
npm install --legacy-peer-deps

echo Compilando proyecto para producción...
npx ng build --configuration production
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: La compilacion fallo. Verifica los errores y corrige antes de continuar.
    pause
    exit /b 1
)

REM Inicializar git si no existe
git rev-parse --is-inside-work-tree >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Inicializando repositorio git...
    git init
)

REM Agregar remoto si no existe
git remote get-url origin >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Agregando remoto origin...
    git remote add origin https://github.com/lorentech-crypto/galeria.git
)

echo Desplegando a GitHub Pages...
npx angular-cli-ghpages --dir=dist/galeria
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: No se pudo desplegar. Verifica que git y el repositorio esten configurados.
    pause
    exit /b 1
)

echo
