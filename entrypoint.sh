#!/bin/bash
if [ -e "/docker-hostname" ]; then
  eventhost=$(cat /docker-hostname)
else
  eventhost=$(hostname)
fi
cmd="riemann-${1} --event-host ${eventhost} ${@:2}"
echo "running: ${cmd}"
exec ${cmd}
