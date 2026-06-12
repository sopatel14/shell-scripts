#!/bin/bash


# Task 1 - Input Validation

if [ $# -eq 0 ]; then
    echo "Error: Please provide a log file."
    echo "Usage: $0 <logfile>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_${DATE}.txt"

echo "Analyzing: $LOG_FILE"
echo

# Task 2 - Error Count

ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOG_FILE" | wc -l)

echo "Total Errors/Failed Events: $ERROR_COUNT"
echo

# Task 3 - Critical Events

echo "--- Critical Events ---"

CRITICAL_EVENTS=$(grep -ni "CRITICAL" "$LOG_FILE")

if [ -z "$CRITICAL_EVENTS" ]; then
    echo "No critical events found."
else
    echo "$CRITICAL_EVENTS"
fi

echo

# Task 4 - Top Error Messages

echo "--- Top 5 Error Messages ---"

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" \
    | sed 's/.*ERROR[: ]*//' \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5)

if [ -z "$TOP_ERRORS" ]; then
    echo "No ERROR messages found."
else
    echo "$TOP_ERRORS"
fi

# Task 5 - Summary Report

TOTAL_LINES=$(wc -l < "$LOG_FILE")

{
echo "========================================"
echo "LOG ANALYSIS REPORT"
echo "========================================"
echo "Date of Analysis : $DATE"
echo "Log File         : $LOG_FILE"
echo "Total Lines      : $TOTAL_LINES"
echo "Total Errors     : $ERROR_COUNT"
echo

echo "Top 5 Error Messages"
echo "--------------------"

if [ -z "$TOP_ERRORS" ]; then
    echo "No ERROR messages found."
else
    echo "$TOP_ERRORS"
fi

echo
echo "Critical Events"
echo "---------------"

if [ -z "$CRITICAL_EVENTS" ]; then
    echo "No critical events found."
else
    echo "$CRITICAL_EVENTS"
fi

} > "$REPORT_FILE"

echo
echo "Report generated: $REPORT_FILE"

# Task 6 - Archive Processed Logs

mkdir -p archive

mv "$LOG_FILE" archive/

echo "Log file moved to archive/"
