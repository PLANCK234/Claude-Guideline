# 08 · Checkpoints：敢放手，因为随时能回退

<div class="cd-lead" markdown>

**一句话：** Claude 每次修改文件前都会自动存档。改坏了，按两下 <kbd>Esc</kbd> 或输入 `/rewind`，就能回到任意一个存档点，然后换一种思路重来。

</div>

<div class="cd-anim" markdown>

![Checkpoints 动画演示](../../assets/howto/08-checkpoints.svg)

</div>

## 三秒上手

<div class="cd-steps" markdown>

1. **什么都不用配置**：存档默认开启，每次改动前自动保存。
2. **想回退时**：按 <kbd>Esc</kbd> <kbd>Esc</kbd>，或输入 `/rewind`。
3. **选择回到哪条消息之前**，再选择回退方式。

</div>

## 五种回退方式

| 选项 | 效果 | 什么时候用 |
| :-- | :-- | :-- |
| **代码和对话都回退** | 完全回到那个时间点 | 这条路走错了，整体重来 |
| **只回退对话** | 保留现在的代码，撤销之后的聊天 | 代码没问题，但对话跑偏了 |
| **只回退代码** | 保留聊天记录，撤销文件改动 | 讨论的结论还要用，但改动不对 |
| **从这里开始压缩** | 把这一点之后的对话总结压缩 | 对话太长，释放上下文 |
| **压缩到这里为止** | 把这一点之前的对话总结压缩 | 早期讨论已不重要 |

回退对话后，当时的提示词会回到输入框，方便你修改后重新发送。

> [!NOTE]
> 两种“压缩”只整理对话上下文，**不会改动磁盘上的文件**。

## 实例：两种方案对比

```text
你：给用户列表接口加缓存，用 Redis 实现。
    （Claude 改了 6 个文件，测试通过，但部署太复杂）

你：/rewind → 选择“代码和对话都回退”，回到加缓存之前

你：换个思路，用进程内的 LRU 缓存，不引入新依赖。
    （Claude 用另一种方式实现，对比后选择这个）
```

本目录的 [更多示例](checkpoint-examples.md) 包括数据库迁移对比、性能优化实验等。

## 适合的场景

<div class="cd-cards" markdown>

<div markdown>

**方案对比**

先试 A，回退，再试 B，选更好的那个。

</div>

<div markdown>

**大型重构**

每完成一段确认一次，出问题只退一小步。

</div>

<div markdown>

**大胆尝试**

不确定的改动放手让 Claude 做，不行就退。

</div>

<div markdown>

**长对话瘦身**

用压缩功能释放上下文，让 Claude 保持清醒。

</div>

</div>

## 存档和 Git 怎么配合

| | Checkpoints | Git |
| :-- | :-- | :-- |
| 时效 | 短期，默认保留 30 天，最多保留最近 100 个文件快照 | 长期 |
| 范围 | 当前会话 | 整个项目历史 |
| 能否共享 | 不能 | 能 |
| 用途 | 探索和试错 | 固化确定的结果 |

**推荐做法：** 用存档探索，确定方案后用 Git 提交。不要把存档当成版本控制。

<details markdown>
<summary>进阶：相关设置</summary>

```json
{
  "fileCheckpointingEnabled": true,
  "cleanupPeriodDays": 30
}
```

- `fileCheckpointingEnabled`：编辑前是否保存文件快照，默认开启；
- `cleanupPeriodDays`：本地数据保留天数，同时影响存档、任务记录、shell 快照和备份；
- 执行过 `/clear` 后，仍然可以回退到清空之前的存档；
- 出于安全考虑，回退不会沿着软链接或硬链接去改动真实目标，这类文件需要手动核对。

</details>

## 常见坑

| 现象 | 原因与解决 |
| :-- | :-- |
| 回退后，通过命令行改动的文件没恢复 | 存档只跟踪 Claude 通过编辑工具做的修改，`rm`、`mv` 等 shell 命令的效果需要自己核对 |
| 以为压缩会改代码 | 压缩只处理对话，不动文件 |
| 一周前的存档找不到了 | 超过保留期或超过 100 个后会被清理，重要结果要用 Git 提交 |

## 下一步

<div class="cd-cards" markdown>

<div markdown>

**[09 · 高级功能 →](../09-advanced-features/README.md)**

规划模式、权限模式、后台任务。

</div>

<div markdown>

**[10 · CLI →](../10-cli/README.md)**

命令行参数与脚本化。

</div>

</div>
