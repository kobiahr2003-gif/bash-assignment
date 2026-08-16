#!/bin/bash
# Exercise 3: System Monitoring
# Usage: ./ex3_system_monitoring.sh

echo "== Date and Time =="
date

echo ""
echo "== CPU Cores =="
nproc

echo ""
echo "== Memory Usage (human-readable) =="
free -h

echo ""
echo "== Top 5 CPU-Consuming Processes =="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
