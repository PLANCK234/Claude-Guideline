# 用法： .\scripts\proxy.ps1 on 7897   |   .\scripts\proxy.ps1 off   |   .\scripts\proxy.ps1 status
param([ValidateSet('on','off','status')][string]$Action = 'status', [int]$Port = 7897)

$names = 'HTTP_PROXY','HTTPS_PROXY','ALL_PROXY','NO_PROXY'

switch ($Action) {
  'on' {
    $p = "http://127.0.0.1:$Port"
    foreach ($n in 'HTTP_PROXY','HTTPS_PROXY','ALL_PROXY') {
      [Environment]::SetEnvironmentVariable($n, $p, 'User'); Set-Item "env:$n" $p
    }
    [Environment]::SetEnvironmentVariable('NO_PROXY', 'localhost,127.0.0.1,::1', 'User')
    $env:NO_PROXY = 'localhost,127.0.0.1,::1'
    Write-Host "✓ 代理已永久开启: $p" -ForegroundColor Green
    Write-Host "  请完全关闭并重开 VS Code / Windows Terminal 让其他窗口生效" -ForegroundColor Yellow
  }
  'off' {
    foreach ($n in $names) {
      [Environment]::SetEnvironmentVariable($n, $null, 'User'); Remove-Item "env:$n" -ErrorAction SilentlyContinue
    }
    Write-Host "✓ 代理已关闭" -ForegroundColor Green
  }
  'status' {
    foreach ($n in $names) { '{0,-12} {1}' -f $n, [Environment]::GetEnvironmentVariable($n, 'User') }
  }
}
