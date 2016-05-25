#!/bin/bash
if [ -e "/docker-hostname" ]; then
  eventhost=$(cat /docker-hostname)
else
  eventhost=$(hostname)
fi
echo "running: riemann-health --event-host ${eventhost} $@"
exec riemann-health --event-host ${eventhost} $@
