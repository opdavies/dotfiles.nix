#!/usr/bin/env bash

set -ueo pipefail

xrandr \
  --output DP-3 --mode 2560x1440 \
  --output eDP-1 --off
