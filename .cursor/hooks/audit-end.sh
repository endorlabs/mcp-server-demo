#!/bin/bash

# audit.sh - Hook script that writes all JSON input to /tmp/agent-audit.log
# This script is designed to be called by Cursor's hooks system for auditing purposes

# Read JSON input from stdin
json_input=$(cat)

# Create timestamp for the log entry
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Create the log directory if it doesn't exist
mkdir -p "$(dirname /tmp/agent-audit.log)"

# Write the timestamped JSON entry to the audit log
echo "[$timestamp] $json_input" >> /tmp/agent-audit.log

# if the file /tmp/malware_detected_packages.txt exists, read it and print the contents
# retrieve the package name and version from the file
followup_message=""
if [ -f /tmp/malware_detected_packages.txt ]; then
    followup_message="detected malware in the following packages: $(cat /tmp/malware_detected_packages.txt) you should not use these packages"
fi

# Exit successfully
cat << EOF
{
  "followup_message": "$followup_message"
}
EOF
exit 0
