@echo off
echo 🔧 Actualizando Angular a v20 y corrigiendo dependencias...
npm install @angular/core@20 @angular/common@20 @angular/router@20 @angular/forms@20 @angular/platform-browser@20 @angular/platform-browser-dynamic@20 @angular/platform-server@20 --force

echo 🧹 Eliminando archivos SSR innecesarios...
del src\server.ts 2>nul
del src\main.server.ts 2>nul
del src\app\app.config.server.ts 2>nul
del src\app\app.routes.server.ts 2>nul

echo 🔄 Corrigiendo app.module.ts...
powershell -Command "(Get-Content src\app\app.module.ts) -replace 'declarations:', 'imports:' | Set-Content src\app\app.module.ts"

echo 🚀 Compilando en modo producción...
npx ng build --configuration production
pause
