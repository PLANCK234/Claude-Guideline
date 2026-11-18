@echo off
chcp 65001 >nul
title Stop All Claude
echo.
echo   ==========================================
echo      Stop All Claude  /  终止所有 Claude
echo   ==========================================
echo.

echo [1/3] 结束 claude.exe ...
taskkill /F /T /IM claude.exe >nul 2>&1 && echo       已结束 || echo       没有运行中的 claude.exe

echo [2/3] 结束 npm 版 Claude Code (node) ...
powershell -NoProfile -Command "$p = Get-CimInstance Win32_Process -Filter \"Name='node.exe'\" | Where-Object { $_.CommandLine -match 'claude-code' }; if ($p) { $p | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }; Write-Host '      已结束' $p.Count '个' } else { Write-Host '      没有' }"

echo [3/3] 结束 WSL 中的 claude ...
where wsl >nul 2>&1 && (wsl.exe -e sh -c "pkill -9 -x claude; pkill -9 -f claude-code/cli" >nul 2>&1 && echo       已结束 || echo       没有) || echo       未安装 WSL

echo.
echo   完成，所有 Claude 已终止。
echo.
pause
