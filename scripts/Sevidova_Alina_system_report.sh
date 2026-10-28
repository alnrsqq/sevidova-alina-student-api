#!/bin/bash

LOG_FILE="logs/Sevidova_Alina_system_report.log"

{
    echo "========================================"
    echo "       SYSTEM REPORT"
    echo "========================================"
    echo "Student: Sevidova Alina"
    echo "Date and time: $(date)"
    echo "Current username: $(whoami)"

    echo
    echo "Operating system and kernel:"
    uname -a

    echo
    echo "CPU information:"
    lscpu | grep "Model name"

    echo
    echo "Memory information:"
    free -h

    echo
    echo "Disk usage and available disk space:"
    df -h

    echo "========================================"
} | tee "$LOG_FILE"

