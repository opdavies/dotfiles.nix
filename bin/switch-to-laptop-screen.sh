#!/usr/bin/env bash

set -ueo pipefail

xrandr \
  --output eDP-1 --mode 1920x1200 \
  --output DP-3 --off
