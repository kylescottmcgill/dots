#!/bin/bash

arg=${1:-mask}

sudo systemctl --runtime ${arg} halt.target poweroff.target reboot.target kexec.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target sleep.target
