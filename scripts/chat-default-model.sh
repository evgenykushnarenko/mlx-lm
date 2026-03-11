#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

MODEL_REPO="${MODEL_REPO:-mlx-community/Qwen3.5-27B-Claude-4.6-Opus-Distilled-MLX-4bit}"

if [ ! -x .venv/bin/python ]; then
  echo "Virtualenv .venv is missing. Run ./scripts/bootstrap-venv.sh first." >&2
  exit 1
fi

exec ./.venv/bin/python -m mlx_lm.chat --model "$MODEL_REPO" "$@"
