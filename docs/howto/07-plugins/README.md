# 07 · Plugins：把整套工作流打包分发

<div class="cd-lead" markdown>

**一句话：** Plugin 是一个“能力套装”。它把命令、skill、子代理、hooks 和 MCP 配置装进一个文件夹，团队成员一条 `/plugin install` 就能拿到完全一致的工作流。

</div>

<div class="cd-anim" markdown>

![Plugins 动画演示](../../assets/howto/07-plugins.svg)

</div>

## 什么时候值得做成 plugin

| 值得做 | 先别急 |
| :-- | :-- |
| 已经有多项能力需要一起分发 | 只有一个命令或一个 skill |
| 团队成员都要用 | 工作流还没稳定、经常变 |
| 希望安装足够简单、可以版本化 | 只是个人使用 |

## plugin 的结构

```text
pr-review/
├── .claude-plugin/
│   └── plugin.json      ← 必需：名称、版本、描述
├── commands/            ← 斜杠命令
├── skills/              ← 技能
├── agents/              ← 子代理
├── hooks/
│   └── hooks.json       ← hook 配置放这里，不是放进 plugin.json
├── .mcp.json            ← MCP server 配置
└── scripts/             ← 实际执行的脚本
```

最小的 `plugin.json`：

```json
{
  "name": "pr-review",
  "version": "1.0.0",
  "description": "Complete PR review workflow with security, testing, and docs",
  "author": { "name": "Your Team" },
  "license": "MIT"
}
```

## 三种安装方式

=== "从插件市场"

    ```text
    /plugin install pr-review
    ```

    在会话中输入 `/plugin` 可以浏览、启用、停用已安装的插件。

=== "本地开发"

    ```bash
    claude plugin init my-plugin        # 创建一个本地插件骨架
    claude --plugin-dir ./my-plugin     # 临时加载某个目录（也可以是 .zip）
    ```

=== "从网址临时加载"

    ```bash
    claude --plugin-url https://example.com/releases/my-plugin-0.3.0.zip
    ```

## 本目录的 3 个示例

<div class="cd-cards" markdown>

<div markdown>

**[pr-review](pr-review/README.md)**

把安全检查、测试覆盖、性能影响分析整合进 PR 审查流程。

</div>

<div markdown>

**[documentation](documentation/README.md)**

README、API 文档的生成、同步与校验。

</div>

<div markdown>

**[devops-automation](devops-automation/README.md)**

部署、回滚、健康检查与故障响应。

</div>

</div>

## 管理命令

| 命令 | 作用 |
| :-- | :-- |
| `/plugin` | 浏览、安装、启用、停用；会提示长期未使用的插件 |
| `/plugin list --enabled` · `--disabled` | 按状态查看已安装插件 |
| `claude plugin uninstall <名字> --prune` | 卸载并清理它带进来的依赖 |
| `claude plugin prune` | 清理已无主的自动安装依赖 |

<details markdown>
<summary>进阶：plugin 还能提供什么</summary>

- **LSP 支持**：通过 `.lsp.json` 提供语言诊断、跳转定义、悬停提示；
- **用户配置项**：暴露 API key、部署区域等可配置参数；
- **持久化数据**：使用专门的目录存放缓存与状态；
- **命名空间**：plugin 中的 skill 带有前缀，不会与你自己的同名 skill 冲突。

</details>

## 设计好 plugin 的几条建议

1. **先把单项能力用顺**，再打包，不要一开始就做“大而全”；
2. **一个 plugin 解决一类问题**，PR 审查和部署分成两个 plugin；
3. **在 README 中写清依赖**：需要 Node、Python、`gh` 还是某个 token；
4. **用版本号管理变更**，团队升级时知道改了什么。

## 常见坑

| 现象 | 原因与解决 |
| :-- | :-- |
| 装了插件，命令却没出现 | 先用 `/plugin list` 确认已启用 |
| 插件里的 hook 不生效 | hook 配置要放在 `hooks/hooks.json`，不是 `plugin.json` |
| 卸载后环境里残留一堆依赖 | 卸载时加 `--prune`，或执行 `claude plugin prune` |

## 下一步

<div class="cd-cards" markdown>

<div markdown>

**[08 · Checkpoints →](../08-checkpoints/README.md)**

放心试错，随时回退。

</div>

<div markdown>

**[09 · 高级功能 →](../09-advanced-features/README.md)**

规划、权限、后台任务与自动化。

</div>

</div>
