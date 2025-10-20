@echo off
setlocal enabledelayedexpansion

echo ==== Fixing Angular 20 SSR issues ====

:: 1️⃣ Reemplazar imports obsoletos
for /R "%cd%" %%f in (*.ts) do (
    set "file=%%f"
    echo Processing !file!

    :: Reemplazar @angular/ssr
    powershell -Command "(Get-Content '!file!') -replace '@angular/ssr', '@angular/platform-server' | Set-Content '!file!'"

    :: Eliminar withEventReplay
    powershell -Command "(Get-Content '!file!') -replace ',?\s*withEventReplay', '' | Set-Content '!file!'"

    :: Eliminar BootstrapContext
    powershell -Command "(Get-Content '!file!') -replace 'BootstrapContext,?\s*', '' | Set-Content '!file!'"
)

:: 2️⃣ Agregar standalone: true en componentes raíz
for /R "%cd%" %%f in (*.ts) do (
    powershell -Command "(Get-Content '%%f') -replace '@Component\(\{', '@Component({`n  standalone: true,' | Set-Content '%%f'"
)

:: 3️⃣ Corregir tipos de Express en server.ts
if exist "%cd%\src\server.ts" (
    powershell -Command "(Get-Content '%cd%\src\server.ts') -replace 'req, res, next', 'req: express.Request, res: express.Response, next: express.NextFunction' | Set-Content '%cd%\src\server.ts'"
    powershell -Command "(Get-Content '%cd%\src\server.ts') -replace 'error', 'error?: any' | Set-Content '%cd%\src\server.ts'"
)

:: 4️⃣ Ajustar bootstrapApplication (eliminar context)
for /R "%cd%" %%f in (*.ts) do (
    powershell -Command "(Get-Content '%%f') -replace ',\s*context', '' | Set-Content '%%f'"
)

echo ==== Done! Try running: npx ng build --configuration production ====
pause
