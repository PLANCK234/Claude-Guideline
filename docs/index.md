# 前言

![ClaudeDIY](assets/banner.svg)

## 注册前必读

> [!WARNING]
> **注册 Claude 前，必须使用住宅 IP，且以下两项评分必须分别达到 99 分以上（≥ 99/100）：IP 评分查询、Claude AI 信任评分。任何一项低于 99 分，都应先排查并更换符合要求的住宅出口，再注册。**
>
> 这是本教程为培养良好网络使用习惯设定的注册标准，并非 Claude 官方公布的门槛，也不保证注册成功或账号不会受限。日常使用时可以适当放宽评分要求，但仍应保持出口稳定，检查 WebRTC、DNS、IPv6 泄露，避免频繁切换节点。

> [!IMPORTANT]
> **Persona：上传护照后、开始人脸验证前，必须先在电脑上运行 `stop-all-claude.bat`。开通 Pro：必须先运行同一脚本，并使用浏览器无痕 / 隐私窗口开通。** 先保存工作，等待脚本执行完毕；流程完成前保持电脑上的 Claude 进程关闭。具体顺序见 [订阅与身份验证](05-personal-notes.md)。这是本教程的操作要求，不代表官方条件或成功保证。

![IP 评分查询：100 分，家庭住宅 IP；网络标识已脱敏](assets/ip-quality.svg)

![Claude AI 信任评分：100 分，家庭住宅 IP；网络标识已脱敏](assets/claude-ip-check.svg)

这是一本 Claude Code 的自学指南，也是我自己从零开始配置、踩坑、到每天离不开它的一段记录。

所以我把这些经验整理成了这份 ClaudeDIY。它不追求面面俱到，只想回答几个最实际的问题：

- 网络应该怎么准备，怎样确认自己的 IP 没有通过 WebRTC、DNS 或 IPv6 泄露出去；
- PowerShell、CMD、WSL、Bash 这些终端，怎样一次配好、永久走代理；
- Claude Code 怎么安装、怎么登录；
- 调整代理之前，为什么必须先终止所有 Claude 进程；
- 怎样用 Claude + Remotion，从一句话做出一段动画。

每一章的命令我都在自己的机器上实际跑过，尽量做到复制即可使用。涉及不同操作系统的地方，都在章节开头放了跳转链接，选择自己的系统直接看对应部分即可。

在这些基础内容之外，本书还收录了一套**进阶功能详解**，从 Slash Commands、Memory、Skills 一直讲到 Hooks、MCP、Plugins 和 CLI，并配有学习路线图、功能总表和互动自测。这部分以开源项目 [claude-howto](https://github.com/luongnv89/claude-howto) 及其 [中文本土化版本](https://github.com/lhfer/claude-howto-zh-cn) 为基础重新编写，每个模块都配有动画演示与实例，来源与许可统一注明在 [来源与许可](howto/index.md#来源与许可) 页。

最后一章是我的个人经验。那部分只是我自己的经历，也不保证对每个人都适用，仅供参考。

## 这本书适合谁

- 希望使用Claude Code的朋友；
- 已经在用，但是担心因为网络、代理、终端配置问题而被封号的朋友；
- 已经装好了 Claude Code，但只会简单对话，希望Claude给你带来一些震撼的朋友。

## 如何参与

这份指南远谈不上完美。如果你发现了错误、过时的命令，或者有更好的做法，欢迎：

- 在任意页面底部的**留言板**直接留言（全站共用一个），我们会采纳有效的做法并特别致谢；
- 欢迎 PR;

如果这份指南对你有所帮助，也欢迎给 [GitHub 仓库](https://github.com/PLANCK234/Claude-Guideline) 点一个 Star，让更多人看到它。

下一页：[使用指南](guide.md)
