#!/usr/bin/env bash
# 终止所有 Claude Code 进程（WSL / Linux / macOS）
# 命令行原生版进程名为 claude；macOS 桌面应用为 Claude；npm 版为 node .../claude-code/cli.js
pids=$( { pgrep -x claude; pgrep -x Claude; pgrep -f "claude-code/cli"; } | sort -u )
if [ -z "$pids" ]; then
  echo "没有运行中的 Claude"
  exit 0
fi
ps -o pid=,args= -p "$(echo $pids | tr ' ' ,)"
kill -9 $pids && echo "✓ 所有 Claude 已终止"
