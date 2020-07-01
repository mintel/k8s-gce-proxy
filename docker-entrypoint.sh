#!/bin/sh
set -e

echo "Waiting $WAIT_TIME_SECONDS before invoking $@"
sleep "$WAIT_TIME_SECONDS" && exec "$@"
