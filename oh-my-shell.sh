#!/usr/bin/env bash

# Check for updates on initial load...
if [ "$OHMYSHELL_DISABLE_AUTO_UPDATE" != "true" ]; then
  $OHMYSHELL/tools/check_for_upgrade.sh
fi
