# 一键体检：代理变量 / 出口 IP / IPv6 / Anthropic 连通性
Write-Host "`n=== Claude 网络体检 ===`n" -ForegroundColor Cyan

Write-Host "[代理变量]" -ForegroundColor Yellow
'HTTP_PROXY','HTTPS_PROXY' | ForEach-Object { '  {0,-12} {1}' -f $_, [Environment]::GetEnvironmentVariable($_) }

Write-Host "`n[出口 IP]" -ForegroundColor Yellow
curl.exe -s --max-time 10 ipinfo.io

Write-Host "`n`n[IPv6 出口]" -ForegroundColor Yellow
$v6 = curl.exe -6 -s --max-time 5 https://api6.ipify.org
if ($v6) { Write-Host "  ✗ 检测到 IPv6: $v6 （建议禁用，见 docs/01-network.md）" -ForegroundColor Red }
else { Write-Host '  ✓ 无 IPv6 出口' -ForegroundColor Green }

Write-Host "`n[Anthropic 连通性]" -ForegroundColor Yellow
$code = curl.exe -s -o NUL -w '%{http_code}' --max-time 10 https://api.anthropic.com
if ($code -ne '000') { Write-Host "  ✓ 可连通 (HTTP $code)" -ForegroundColor Green }
else { Write-Host '  ✗ 连不上，检查代理端口' -ForegroundColor Red }

Write-Host "`n浏览器端请再打开 https://browserleaks.com/webrtc 检查 WebRTC`n"
