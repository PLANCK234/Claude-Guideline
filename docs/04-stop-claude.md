# 04 · 终止所有 Claude 进程

## 为什么要先终止所有进程

**调整代理之前，务必先终止所有 Claude 进程。** 这是本书最重要的一条习惯，目的是防止账号被风控误判、误封。

Claude 的会话在后台会持续与服务器保持连接、发送请求。如果在会话运行期间关闭代理、切换节点或修改代理配置，同一个账号就会在很短的时间内从多个不同的 IP 地址发出请求，网络也可能短暂地绕过代理直连。这种“IP 突然跳变”的行为很容易被风控系统识别为异常登录或账号共享，从而触发验证甚至封号。

因此，正确的顺序是：

```text
① 终止所有 Claude 进程  →  ② 调整代理 / 切换节点  →  ③ 检测 IP 是否正确  →  ④ 重新打开 Claude
```

| 场景 | 是否需要先终止 |
| :-- | :-- |
| 关闭或重启代理客户端 | **需要** |
| 切换节点、更换订阅 | **需要** |
| 修改代理端口、开关 TUN 模式 | **需要** |
| 修改环境变量或 `settings.json` 中的代理配置 | **需要**（配置也只在重启后生效） |
| 电脑从睡眠中唤醒、更换 Wi-Fi | 建议先确认代理正常，再继续使用 |

第 ③ 步可以使用 [01 章](01-network.md#3-检测网站) 的检测网站，或在终端执行 `curl ipinfo.io`（PowerShell 中为 `curl.exe ipinfo.io`），确认 IP 仍是你固定使用的那个节点后，再重新打开 Claude。

> [!IMPORTANT]
> 这里的“所有进程”包括 **桌面应用、VS Code 插件、命令行版以及 WSL 中的会话**。只关掉一个窗口是不够的，后台仍可能有其他会话在运行。

## 选择你的系统

| 系统 | 跳转 |
| :-- | :-- |
| Windows | [Windows](#windows) |
| WSL / Linux / macOS | [WSL / Linux / macOS](#wsl--linux--macos) |

## Windows

### 方法一：运行 [`stop-all-claude.bat`](https://github.com/PLANCK234/Claude-Guideline/blob/main/stop-all-claude.bat)

该脚本依次执行：

1. 结束所有 `claude.exe` 进程及其子进程
2. 结束 npm 版 Claude Code（运行于 `node.exe` 中的 `claude-code`）
3. 结束 WSL 中的 `claude` 进程

> [!WARNING]
> **Claude 桌面应用**的进程名同为 `Claude.exe`，会被一并终止——这正是我们需要的，桌面应用中的 Code 会话同样会与服务器通信。请先保存工作。

### 方法二：PowerShell

```powershell
Get-Process claude -ErrorAction SilentlyContinue | Stop-Process -Force
```

仅查看正在运行的进程：

```powershell
Get-Process claude -ErrorAction SilentlyContinue | Format-Table Id, StartTime, Path
```

## WSL / Linux / macOS

```bash
pgrep -a claude                                 # 查看运行中的进程
pkill -9 -x claude; pkill -9 -x Claude; pkill -9 -f claude-code/cli  # 终止全部（命令行版、macOS 桌面应用、npm 版）
```

也可运行：`bash scripts/stop-all-claude.sh`

---

## 正常退出单个会话

| 情况 | 操作 |
| :-- | :-- |
| 中断正在执行的操作 | `Esc` |
| 退出当前会话 | 连按两次 `Ctrl + C`，或输入 `/exit` |
| 窗口无响应 | 使用上述终止方法 |
| 准备调整代理 | **不要只退出单个会话**，使用上述方法终止全部进程 |

**[下一章：实战 · 用 Claude + Remotion 做动画 →](06-remotion-animation.md)**
