#!/usr/bin/env bash
# 用法： bash scripts/proxy.sh on 7897   |   bash scripts/proxy.sh off
# 写入 ~/.bashrc 与 ~/.zshrc（如存在），永久生效；执行后 source 配置文件或重开终端。
# WSL：每次打开终端时自动判断，127.0.0.1 可用则使用（镜像网络），否则使用 Windows 主机 IP（NAT）。

MARK='# >>> claude-diy proxy >>>'
END='# <<< claude-diy proxy <<<'
RCS=("$HOME/.bashrc"); [ -f "$HOME/.zshrc" ] && RCS+=("$HOME/.zshrc")

strip() {
  for rc in "${RCS[@]}"; do
    [ -f "$rc" ] && sed -i.bak -e "/$MARK/,/$END/d" -e '/# >>> claude-guide proxy >>>/,/# <<< claude-guide proxy <<</d' "$rc"
  done
}

case "${1:-}" in
  on)
    port="${2:-7897}"
    if ! [[ "$port" =~ ^[0-9]+$ ]] || (( port < 1 || port > 65535 )); then
      echo "端口无效：$port" >&2; exit 2
    fi
    if grep -qi microsoft /proc/version 2>/dev/null; then
      host_block=$(cat <<'EOS'
if timeout 1 bash -c "</dev/tcp/127.0.0.1/$PROXY_PORT" 2>/dev/null; then
  PROXY_HOST=127.0.0.1
else
  PROXY_HOST=$(ip route show default | awk '{print $3; exit}')
fi
EOS
)
    else
      host_block='PROXY_HOST=127.0.0.1'
    fi
    strip
    for rc in "${RCS[@]}"; do
      cat >> "$rc" <<EOF

$MARK
PROXY_PORT=$port
$host_block
export HTTP_PROXY="http://\$PROXY_HOST:\$PROXY_PORT"
export HTTPS_PROXY="\$HTTP_PROXY" ALL_PROXY="\$HTTP_PROXY"
export http_proxy="\$HTTP_PROXY" https_proxy="\$HTTP_PROXY" all_proxy="\$HTTP_PROXY"
export NO_PROXY=localhost,127.0.0.1,::1 no_proxy=localhost,127.0.0.1,::1
$END
EOF
    done
    echo "✓ 代理配置已写入：${RCS[*]}"
    echo "  执行 source ~/.bashrc（zsh 为 source ~/.zshrc）或重开终端后生效"
    echo "  验证：echo \$HTTPS_PROXY && curl ipinfo.io" ;;
  off)
    strip
    echo "✓ 已移除代理配置，重开终端后生效"
    echo "  当前窗口可执行：unset HTTP_PROXY HTTPS_PROXY ALL_PROXY http_proxy https_proxy all_proxy" ;;
  *)
    echo "用法: bash $0 on [端口] | off"
    echo "当前 HTTPS_PROXY=${HTTPS_PROXY:-未设置}" ;;
esac
