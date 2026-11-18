# 贡献指南

感谢你愿意为 ClaudeDIY 出一份力。

| 你想做的 | 去哪里 |
| :-- | :-- |
| 提问、求助、交流经验 | 网站任意页面底部的 [留言板](https://planck234.github.io/Claude-Guideline/#__comments)（全站共用） |
| 报告脚本错误 | [Issues](https://github.com/PLANCK234/Claude-Guideline/issues/new/choose) |
| 修正或补充内容 | 直接提交 Pull Request |

## 写作约定

1. **可复现**：文中的每条命令都应在真实环境中验证过。
2. **简洁**：一句话能说清楚的，不写成一段。
3. **区分系统**：涉及操作系统差异的地方，提供对应的跳转链接。
4. **保护隐私**：截图与日志中请隐去 IP、订阅链接和账号信息。

## 本地预览

正文位于 `docs/` 目录，站点使用 [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) 构建：

```bash
pip install -r requirements.txt
mkdocs serve
```

推送到 `main` 分支后，GitHub Actions 会自动构建并发布到 GitHub Pages。
