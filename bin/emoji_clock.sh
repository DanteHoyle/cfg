#!/usr/bin/env bash
# Get current hour in 12-hour format (1–12)
hour=$(date +%I | sed 's/^0//')

# Map hour to emoji
case $hour in
  1)  emoji="🕐" ;;  # one o’clock
  2)  emoji="🕑" ;;
  3)  emoji="🕒" ;;
  4)  emoji="🕓" ;;
  5)  emoji="🕔" ;;
  6)  emoji="🕕" ;;
  7)  emoji="🕖" ;;
  8)  emoji="🕗" ;;
  9)  emoji="🕘" ;;
  10) emoji="🕙" ;;
  11) emoji="🕚" ;;
  12) emoji="🕛" ;;
esac

echo "$emoji"
