#!/bin/bash

# Get the list of sh files in the scripts directory
scripts_dir="scripts"
sh_files=$(find "$scripts_dir" -type f -name "*.sh")

# Check if a script name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: ./auto.sh [delete|info|init-volume|prune|init]"
  exit 1
fi

# Define an associative array to map user input to script names
declare -A script_mapping
script_mapping["delete"]="delete.sh"
script_mapping["info"]="info.sh"
script_mapping["init-volume"]="init-volume.sh"
script_mapping["prune"]="prune.sh"
script_mapping["init"]="init.sh"

# Check if the user input corresponds to a valid script name
if [ -n "${script_mapping[$1]}" ]; then
  script_to_run="${script_mapping[$1]}"
  echo "Running $script_to_run"
  bash "$scripts_dir/$script_to_run"
else
  echo "Invalid command: $1"
fi
