#!/bin/sh
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Canonical Ltd.
set -xeu
if [ -n "${SPREAD_HOST_PATH-}" ]; then
	PATH="$SPREAD_HOST_PATH"
fi

image-garden discard "$SPREAD_SYSTEM_ADDRESS"

if [ -f /tmp/vhostqemu."$SPREAD_SYSTEM_ADDRESS".pid ]; then
	kill "$(cat /tmp/vhostqemu."$SPREAD_SYSTEM_ADDRESS".pid)" || true
	rm -f /tmp/vhostqemu."$SPREAD_SYSTEM_ADDRESS".pid
fi
