#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

MODEL_REPO="${MODEL_REPO:-mlx-community/Qwen3.5-27B-Claude-4.6-Opus-Distilled-MLX-4bit}"
HOST="${HOST:-127.0.0.1}"
PORT="${PORT:-8080}"
MAX_TOKENS="${MAX_TOKENS:-2048}"
CHAT_TEMPLATE_ARGS="${CHAT_TEMPLATE_ARGS:-{\"enable_thinking\":false}}"
LOG_LEVEL="${LOG_LEVEL:-INFO}"

if [ ! -x .venv/bin/python ]; then
  echo "Virtualenv .venv is missing. Run ./scripts/bootstrap-venv.sh first." >&2
  exit 1
fi

exec ./.venv/bin/python -m mlx_lm server \
  --model "$MODEL_REPO" \
  --host "$HOST" \
  --port "$PORT" \
  --log-level "$LOG_LEVEL" \
  --max-tokens "$MAX_TOKENS" \
  --chat-template-args "$CHAT_TEMPLATE_ARGS" \
  "$@"
