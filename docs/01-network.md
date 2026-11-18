# 01 · 网络准备与 IP 泄露检测

## 1. 代理选择

| 项目 | 建议 |
| :-- | :-- |
| 费用 | 每月 ¥20 以上的正规服务通常即可满足需求 |
| IP 类型 | 不要求住宅 IP，普通机房节点即可 |
| 节点 | 选择稳定、低延迟的节点并固定使用，避免频繁切换 |
| 客户端模式 | 建议启用 **TUN 模式**，接管全部流量，覆盖面优于“系统代理” |

> [!TIP]
> 请记录代理客户端的 **HTTP / Mixed 端口**（Clash 系默认 `7890`，v2rayN 默认 `10808/10809`），第 02 章会用到。

---

## 2. 泄露的含义

![泄露示意图](assets/leak-check.svg)

系统代理通常只接管部分流量。**WebRTC（UDP）、DNS 与 IPv6** 是最常见的绕过路径，会使网站获取到本机真实 IP。

---

## 3. 检测网站

| 网站 | 检测内容 | 正常结果 |
| :-- | :-- | :-- |
| **[browserleaks.com/webrtc](https://browserleaks.com/webrtc)** | **WebRTC 专项检测** | 公网 IP 仅显示代理 IP，或显示 `n/a` |
| [browserleaks.com/ip](https://browserleaks.com/ip) | 浏览器出口 IP | 为代理 IP |
| [ipleak.net](https://ipleak.net) | IP、DNS、WebRTC 综合检测 | 未出现本地运营商 |
| [dnsleaktest.com](https://www.dnsleaktest.com) | DNS 泄露（选择 Extended test） | 未出现本地运营商 DNS |
| [test-ipv6.com](https://test-ipv6.com) | IPv6 连通性 | 无 IPv6，或 IPv6 同样经由代理 |
| [whoer.net](https://whoer.net) | 综合评分 | 关注具体扣分项 |
| [ping0.cc](https://ping0.cc) | IP 类型与风险值 | 仅供参考 |

**终端出口 IP 检测：**

```bash
curl ipinfo.io        # Bash / WSL / macOS
curl.exe ipinfo.io    # PowerShell（需带 .exe）
```

---

## 4. 禁用 WebRTC 泄露

<details open markdown>
<summary><b>Firefox</b></summary>

地址栏输入 `about:config`，搜索 `media.peerconnection.enabled`，设置为 **false**。

</details>

<details markdown>
<summary><b>Chrome / Edge</b></summary>

安装 **[WebRTC Leak Prevent](https://chromewebstore.google.com/search/WebRTC%20Leak%20Prevent)**，或在 **uBlock Origin** 设置中勾选“防止 WebRTC 泄露本地 IP”。
完成后在 [browserleaks.com/webrtc](https://browserleaks.com/webrtc) 复测。

</details>

<details markdown>
<summary><b>Safari / iPad</b></summary>

Safari 默认不暴露本地 IP。确保代理 App 处于**全局 / VPN 模式**，再通过 Safari 打开检测网站确认。

</details>

---

## 5. 禁用 IPv6

| 系统 | 跳转 |
| :-- | :-- |
| Windows | [Windows](#windows) |
| Linux / WSL | [Linux / WSL](#linux--wsl) |
| macOS | [macOS](#macos) |

### Windows

以**管理员身份**运行 PowerShell，两步均需执行：

```powershell
# 1. 在所有网卡上取消 IPv6 绑定
Get-NetAdapterBinding -ComponentID ms_tcpip6 | Disable-NetAdapterBinding -ComponentID ms_tcpip6

# 2. 通过注册表全局禁用（0xFF），重启后生效
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' `
  -Name DisabledComponents -PropertyType DWord -Value 0xFF -Force

Restart-Computer
```

也可使用仓库脚本：`.\scripts\ipv6.ps1 off`（恢复：`.\scripts\ipv6.ps1 on`）

<details markdown>
<summary>手动恢复 IPv6</summary>

```powershell
Get-NetAdapterBinding -ComponentID ms_tcpip6 | Enable-NetAdapterBinding -ComponentID ms_tcpip6
Remove-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' -Name DisabledComponents
Restart-Computer
```

</details>

> [!NOTE]
> 禁用后 `ping ::1` 仍可成功属正常现象（本机回环）。以 [test-ipv6.com](https://test-ipv6.com) 显示无 IPv6 为准。

### Linux / WSL

```bash
sudo tee /etc/sysctl.d/99-disable-ipv6.conf >/dev/null <<'EOF'
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
sudo sysctl --system
```

WSL 也可在 Windows 的 `%USERPROFILE%\.wslconfig` 中添加：

```ini
[wsl2]
kernelCommandLine = ipv6.disable=1
```

随后执行 `wsl --shutdown` 并重新打开。

### macOS

```bash
networksetup -listallnetworkservices          # 查看网络服务名称
networksetup -setv6off "Wi-Fi"
networksetup -setv6off "Ethernet"             # 如有有线网卡，一并关闭
# 恢复：networksetup -setv6automatic "Wi-Fi"
```

---

## 检查清单

- [ ] 代理客户端已启用 TUN 模式，并记录 HTTP 端口
- [ ] [browserleaks.com/webrtc](https://browserleaks.com/webrtc) 仅显示代理 IP
- [ ] [dnsleaktest.com](https://www.dnsleaktest.com) 未出现本地运营商
- [ ] [test-ipv6.com](https://test-ipv6.com) 显示无 IPv6

**[下一章：终端代理配置 →](02-terminal-proxy.md)**
