# Sincroniza automáticamente esta carpeta con GitHub: hace commit de los cambios locales y pull+push.
$ErrorActionPreference = "Stop"
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")

Set-Location -Path $PSScriptRoot

$status = git status --porcelain
if ($status) {
    git add -A
    git commit -m "Auto sync $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-Null
}

git pull --rebase --autostash origin main 2>$null
git push origin main 2>$null
