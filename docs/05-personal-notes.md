<div align="center">

</div>

---

> [!NOTE]
> 以下全部是**作者本人的经历**，不保证对你同样适用。

## 💳 订阅

> [!IMPORTANT]
> **按本教程开通 Pro 时，必须使用浏览器的无痕 / 隐私窗口，并且必须在开通前先在电脑上运行 `stop-all-claude.bat`。**

1. 保存电脑上正在进行的工作，运行仓库根目录的 [`stop-all-claude.bat`](https://github.com/PLANCK234/Claude-Guideline/blob/main/stop-all-claude.bat)，等待脚本执行完毕。
2. 打开浏览器的**无痕 / 隐私窗口**，登录需要开通 Pro 的 Claude 账号。
3. 在该窗口中完成网页端订阅；完成前保持电脑上的 Claude 应用和会话关闭，避免重新启动。

以上为本教程的操作要求，不是 Claude 官方公布的订阅条件；无痕窗口不会隐藏公网 IP，也不能替代网络检测。

## 🪪 Persona 身份验证

- 准备好**有效的本人证件（护照）**，光线充足，按页面提示一步步来。

> [!IMPORTANT]
> **上传护照后、准备开始人脸验证时，先在电脑上运行 `stop-all-claude.bat`，等待脚本执行完毕，再继续人脸验证。** 不要等到人脸验证完成后才运行。

- 先保存电脑上正在进行的工作；即使是在手机或平板上验证，也要在电脑上执行该脚本。
- 保持用于 Persona 验证的浏览器页面打开；脚本用于终止电脑上的 Claude 进程，详见 [04 章](04-stop-claude.md)。验证完成前保持这些进程关闭。
- 此步骤是本教程的操作提醒，不保证 Persona 验证通过，仍须按验证页面要求操作。

## 🌐 网络

- **注册必须使用住宅 IP，IP 评分与 Claude AI 信任评分均须 ≥ 99 分**；这是本教程的注册标准，日常使用可以适当放宽评分要求，详见 [01 章](01-network.md)。

- 节点**固定一个**用。
- 按 [01 章](01-network.md) 把 WebRTC、DNS、IPv6 都测一遍，做好ip防泄漏。
- 终端一定按 [02 章](02-terminal-proxy.md) 配好代理，浏览器能用 ≠ 终端能用。

## 🧠 使用习惯

- 安装 [Claude Code](https://claude.com/product/claude-code?utm_source=google_brand&utm_campaign={campaign}&utm_medium=cpc&utm_content=823571895578&utm_term=claude%20desktop&targetid=kwd-2365857011988&gad_source=1&gad_campaignid=24223071325&gbraid=0AAAAAqwcL8k11RJicZkMWNLmTdYabrfZm&gclid=Cj0KCQiAtvXXBhC2ARIsAJc8SUQPYXyJTWW93debegA5EZ_YW0zHrOuSfKeUOPsFERu8p8Zqqkdc1JcaAlvIEALw_wcB)
- Claude Code for VS Code插件

## 🕳️ 踩过的坑

| 现象 | 原因 / 解决 |
| :-- | :-- |
| 配了代理还是连不上 | 填成了 SOCKS 端口，Claude Code 只认 **HTTP** |
| 设置了环境变量不生效 | 没有**完全关掉** VS Code / Windows Terminal 再重开 |
| WSL 里连不上 | 可能你的 Windows 不支持镜像网络，要改用 Windows IP 的方法 |
| 关代理换节点被封 | 在这之前 [一键终止](04-stop-claude.md)，启用前换回来 |
| 谷歌邮箱注册被秒封 | 用谷歌邮箱注册前一定要确认该邮箱有辅助验证邮箱和手机号 |

<div align="center">

</div>
