@echo off
echo 🧹 Eliminando archivos de SSR innecesarios...
del src\server.ts 2>nul
del src\main.server.ts 2>nul
del src\app\app.config.server.ts 2>nul
del src\app\app.routes.server.ts 2>nul

echo ⚙️ Corrigiendo app.module.ts...
powershell -Command "(Get-Content src\app\app.module.ts) -replace 'declarations:', 'imports:' | Set-Content src\app\app.module.ts"

echo 🧩 Limpiando y reinstalando dependencias...
rmdir /s /q dist 2>nul
rmdir /s /q node_modules 2>nul
npm install --force

echo 🚀 Compilando app de produccion...
npx ng build --configuration production
pause
