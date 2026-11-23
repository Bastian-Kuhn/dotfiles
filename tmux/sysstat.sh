#!/bin/sh
# CPU, load and free memory for the tmux status line (macOS and Linux).
# CPU: share of all cores in use.
# LOAD: 1 minute load average.
# FREE: memory still available without pressure (cache counts as free).

export LC_ALL=C

if [ "$(uname)" = Darwin ]; then
  # Summed %cpu of all processes, divided by the number of cores.
  cores=$(sysctl -n hw.ncpu)
  cpu=$(ps -A -o %cpu= | awk -v c="$cores" '{s+=$1} END {printf "%d", s/c}')

  load=$(sysctl -n vm.loadavg | awk '{print $2}')

  # Physical memory minus active + wired + compressed pages, like Activity Monitor.
  total=$(sysctl -n hw.memsize)
  free=$(vm_stat | awk -v t="$total" '
    /page size of/            {ps=$8}
    /Pages active/            {a=$3}
    /Pages wired down/        {w=$4}
    /occupied by compressor/  {c=$5}
    END {printf "%.1fG", (t - (a+w+c)*ps)/1073741824}')
else
  # Busy share of the CPU time since the last call, from /proc/stat.
  # The previous counters are kept in a per user state file.
  state="${XDG_RUNTIME_DIR:-/tmp}/tmux-sysstat-$(id -u)"
  set -- $(awk '/^cpu / {idle=$5+$6; t=0; for (i=2; i<=NF; i++) t+=$i; print t, idle}' /proc/stat)
  total=$1 idle=$2
  cpu=0
  if [ -r "$state" ]; then
    read -r ptotal pidle < "$state"
    cpu=$(awk -v t="$total" -v i="$idle" -v pt="$ptotal" -v pi="$pidle" \
      'BEGIN {dt=t-pt; printf "%d", (dt > 0) ? 100*(dt-(i-pi))/dt : 0}')
  fi
  echo "$total $idle" > "$state"

  load=$(cut -d' ' -f1 /proc/loadavg)

  free=$(awk '/^MemAvailable:/ {printf "%.1fG", $2/1048576}' /proc/meminfo)
fi

L='#[fg=colour244]'; V='#[fg=colour250]'
printf '%scpu %s%s%%  %sload %s%s  %sfree %s%s#[fg=colour246]' "$L" "$V" "$cpu" "$L" "$V" "$load" "$L" "$V" "$free"
