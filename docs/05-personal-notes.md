<div align="center">

</div>

---

> [!NOTE]
> 以下全部是**作者本人的经历**，不保证对你同样适用。

## 💳 订阅

- 我用的是**自己名下的新加坡 Visa 卡**，在 claude.ai 直接订阅。
- 建议在**网页端**订阅，方便后续在设置里管理和取消。

## 🪪 Persona 身份验证

- 我是在 **iPad（美国地区时间，系统语言为英文，能正常用tiktok）** 上完成的。
- 准备好**有效的本人证件（护照）**，光线充足，按页面提示一步步来。

## 🌐 网络

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
