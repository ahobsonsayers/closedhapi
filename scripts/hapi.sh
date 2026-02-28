#!/usr/bin/env bash

cleanup() {
  kill -TERM "$HUB_PID" 2>/dev/null || true
  wait "$HUB_PID" 2>/dev/null || true
  
  kill -TERM "$RUNNER_PID" 2>/dev/null || true
  wait "$RUNNER_PID" 2>/dev/null || true
}

trap cleanup TERM INT

# Start hapi runner
hapi runner start --foreground &
RUNNER_PID=$!

# Start hapi hub
hapi hub --no-relay &
HUB_PID=$!

# Wait for hub to exit
wait "$HUB_PID" 2>/dev/null || true

cleanup
