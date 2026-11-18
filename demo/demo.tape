# VHS 录制脚本：https://github.com/charmbracelet/vhs
# 本地录制：vhs demo/demo.tape   → 生成 docs/assets/demo.gif
# push 后 GitHub Actions 会自动生成

Output docs/assets/demo.gif

Set Shell bash
Set FontFamily "Noto Sans Mono CJK SC"
Set FontSize 20
Set Width 1200
Set Height 640
Set Padding 30
Set Theme "Catppuccin Mocha"
Set TypingSpeed 60ms

Type "# ① 一行命令让终端永久走代理" Enter
Sleep 600ms
Type "bash scripts/proxy.sh on 7890" Sleep 400ms Enter
Sleep 1.5s
Type "source ~/.bashrc && echo $HTTPS_PROXY" Sleep 400ms Enter
Sleep 2s

Type "clear" Enter
Type "# ② 一键终止所有 Claude" Enter
Sleep 600ms
Type "bash scripts/stop-all-claude.sh" Sleep 400ms Enter
Sleep 2s

Type "# ③ 用完关掉代理" Enter
Type "bash scripts/proxy.sh off" Sleep 400ms Enter
Sleep 2.5s
