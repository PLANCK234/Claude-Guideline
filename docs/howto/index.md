# 进阶篇：Claude Code 功能详解

<div class="cd-lead" markdown>

基础篇让你把 Claude Code 跑起来，进阶篇让你把它用顺手。10 个模块，每个都按 **一句话看懂 → 动画演示 → 三步上手 → 实例 → 常见坑** 的顺序编排，可以从任意一个开始读。

</div>

## 从哪里开始

| 你的情况 | 建议路线 |
| :-- | :-- |
| 刚装好，只会简单对话 | 01 → 02 → 08，约 1 小时 |
| 已经会用，想提高效率 | 03 → 06 → 05 → 04 |
| 想做团队方案或自动化 | 09 → 10 → 07 |
| 不确定 | 先看 [学习路线图](LEARNING-ROADMAP.md)，或在仓库中运行 `/self-assessment` 自测 |

## 入门：先把基础打牢

<div class="cd-cards" markdown>

<div markdown>

**[01 · Slash Commands](01-slash-commands/README.md)**

一个斜杠，召唤一个工作流。必会的 12 个命令，以及如何写自己的命令。

</div>

<div markdown>

**[02 · Memory](02-memory/README.md)**

用 `CLAUDE.md` 让 Claude 记住项目规矩，不用每次重新交代。

</div>

<div markdown>

**[08 · Checkpoints](08-checkpoints/README.md)**

自动存档，改坏了按两下 Esc 回退，敢放手让 Claude 改。

</div>

</div>

## 进阶：让 Claude 自动干活

<div class="cd-cards" markdown>

<div markdown>

**[03 · Skills](03-skills/README.md)**

把好用的流程打包成技能，需求对上时自动触发。

</div>

<div markdown>

**[06 · Hooks](06-hooks/README.md)**

在固定时机自动执行脚本：拦截危险命令、自动格式化。

</div>

<div markdown>

**[05 · MCP](05-mcp/README.md)**

接入 GitHub、数据库、浏览器，让 Claude 拿到实时数据。

</div>

<div markdown>

**[04 · Subagents](04-subagents/README.md)**

给 Claude 配一支专业小队，并行分工、上下文隔离。

</div>

</div>

## 高级：自动化与团队协作

<div class="cd-cards" markdown>

<div markdown>

**[09 · 高级功能](09-advanced-features/README.md)**

规划模式、权限模式、后台任务、worktree、沙箱。

</div>

<div markdown>

**[10 · CLI](10-cli/README.md)**

`claude -p` 接入脚本、CI/CD 与批处理。

</div>

<div markdown>

**[07 · Plugins](07-plugins/README.md)**

把命令、技能、子代理、hooks 打包分发给团队。

</div>

</div>

## 工具页

| 页面 | 用途 |
| :-- | :-- |
| [学习路线图](LEARNING-ROADMAP.md) | 自测起点，按阶段安排学习顺序 |
| [概念总览](claude_concepts_guide.md) | 容易混淆的核心概念对照 |
| [功能总表](CATALOG.md) | 全部功能与示例的全局地图 |
| [速查卡](QUICK_REFERENCE.md) | 常用命令与配置速查 |
| [新能力速览](WHATS-NEW.md) | 2026 年 8 月值得关注的新功能 |

---

## 来源与许可

进阶篇（`docs/howto/` 目录下的全部内容，以及仓库根目录 `.claude/skills/` 下的 `lesson-quiz`、`self-assessment` 两个 skill）**以开源项目为基础，不是 ClaudeDIY 完全原创**。来源与许可信息统一在本节注明。

### 来源

| 项目 | 说明 | 许可证 |
| :-- | :-- | :-- |
| [luongnv89/claude-howto](https://github.com/luongnv89/claude-howto) | 原始英文项目，Copyright (c) 2024 luongnv89 | MIT |
| [lhfer/claude-howto-zh-cn](https://github.com/lhfer/claude-howto-zh-cn) | 上述项目的中文本土化版本，本部分直接取材于该版本 | MIT |

- 取材版本：`lhfer/claude-howto-zh-cn` 的 `main` 分支，commit `f0da0c6`（2026-08-06，对应 Claude Code `v2.1.220`）。
- 取材范围：
    - `01-slash-commands` 至 `10-cli` 共 10 个功能模块及其示例文件（命令、skill、子代理、hook 脚本、MCP 配置、插件示例、截图）；
    - 学习路线图 `LEARNING-ROADMAP.md`、功能总表 `CATALOG.md`、概念总览 `claude_concepts_guide.md`、速查卡 `QUICK_REFERENCE.md`；
    - 新能力速览 `WHATS-NEW.md`，节选自原项目 `resources.md`；
    - 互动学习 skill：`lesson-quiz`、`self-assessment`。

### 我们做了哪些修改

- **10 个模块的说明文档（各目录下的 `README.md`）已按 ClaudeDIY 的风格重新编写**：以原文内容为依据，重新组织结构，精简了版本变更记录与本地化规范等内容，补充了实例、对照表和动画演示；
- 10 张动画演示图（`docs/assets/howto/`）为 ClaudeDIY 原创；
- 示例文件（命令、skill、子代理、脚本、配置）保持原样，仅调整了两个互动 skill 中引用教程目录的路径；
- 工具页删除了原项目 Logo，指向未转载文件的链接改为原仓库的在线地址。

如需原始版本或参与改进，请前往原项目。若原作者对本部分有任何异议，请通过 [Issue](https://github.com/PLANCK234/Claude-Guideline/issues) 联系，我们会第一时间处理。

### 许可证全文

原项目采用 MIT 许可证，依照其要求保留原版权声明与许可全文（亦见同目录下的 [`LICENSE`](https://github.com/PLANCK234/Claude-Guideline/blob/main/docs/howto/LICENSE) 文件）：

```text
MIT License

Copyright (c) 2024 luongnv89

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
