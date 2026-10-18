#!/bin/sh
# CPU, load and free memory for the tmux status line (macOS).
# CPU: summed %cpu of all processes, divided by the number of cores.
# LOAD: 1 minute load average.
# FREE: physical memory minus active + wired + compressed pages, i.e. what is
# still available without pressure (cache counts as free, like Activity Monitor).

export LC_ALL=C
cores=$(sysctl -n hw.ncpu)
cpu=$(ps -A -o %cpu= | awk -v c="$cores" '{s+=$1} END {printf "%d", s/c}')

load=$(sysctl -n vm.loadavg | awk '{print $2}')

total=$(sysctl -n hw.memsize)
free=$(vm_stat | awk -v t="$total" '
  /page size of/            {ps=$8}
  /Pages active/            {a=$3}
  /Pages wired down/        {w=$4}
  /occupied by compressor/  {c=$5}
  END {printf "%.1fG", (t - (a+w+c)*ps)/1073741824}')

L='#[fg=colour244]'; V='#[fg=colour250]'
printf '%scpu %s%s%%  %sload %s%s  %sfree %s%s#[fg=colour246]' "$L" "$V" "$cpu" "$L" "$V" "$load" "$L" "$V" "$free"
