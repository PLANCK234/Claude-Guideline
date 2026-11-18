# 用法（管理员 PowerShell）： .\scripts\ipv6.ps1 off   |   .\scripts\ipv6.ps1 on   |   .\scripts\ipv6.ps1 status
param([ValidateSet('on','off','status')][string]$Action = 'status')

$key = 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters'

if ($Action -ne 'status' -and -not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole('Administrators')) {
  Write-Host '✗ 请右键 PowerShell → 以管理员身份运行' -ForegroundColor Red; exit 1
}

switch ($Action) {
  'off' {
    Get-NetAdapterBinding -ComponentID ms_tcpip6 | Disable-NetAdapterBinding -ComponentID ms_tcpip6
    New-ItemProperty -Path $key -Name DisabledComponents -PropertyType DWord -Value 0xFF -Force | Out-Null
    Write-Host '✓ IPv6 已禁用，重启电脑后完全生效' -ForegroundColor Green
  }
  'on' {
    Get-NetAdapterBinding -ComponentID ms_tcpip6 | Enable-NetAdapterBinding -ComponentID ms_tcpip6
    Remove-ItemProperty -Path $key -Name DisabledComponents -ErrorAction SilentlyContinue
    Write-Host '✓ IPv6 已恢复，重启电脑后完全生效' -ForegroundColor Green
  }
  'status' {
    Get-NetAdapterBinding -ComponentID ms_tcpip6 | Format-Table Name, Enabled
    $v = (Get-ItemProperty $key -Name DisabledComponents -ErrorAction SilentlyContinue).DisabledComponents
    "注册表 DisabledComponents = $(if ($null -eq $v) { '未设置（IPv6 开启）' } else { '0x{0:X}' -f $v })"
  }
}
