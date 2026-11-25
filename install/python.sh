#!/usr/bin/env bash

# install uv
if [ `which uv` ]; then
  uv self update
else
  curl -LsSf https://astral.sh/uv/install.sh | sh
  . ~/.bashrc
fi

# Install latest (stable) Python
uv python install
# uv python install --default
