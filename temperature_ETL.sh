#! /bin/bash

# Extract reading with get_temp_API
python3 fetching_data.py | grep "Lagos" >> temperature.log 

# Append reading to temperature.log

# Buffer the last hour of readings

# Call get_stats.py to  aggregate the readings.

# Load the stats using load_stats_api

# Schedule the script to run every minutes.

grep "pattern" file.txt