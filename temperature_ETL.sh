#! /bin/bash

# Extract reading with get_temp_API
# Append reading to temperature.log
python3 fetching_data.py | grep "Lagos" | cut -d "," -f2-4 | tr ")" " "  >> logs/Lag_weather.log
python3 fetching_data.py | grep "Abuja" | cut -d "," -f2-4 | tr ")" " "  >> logs/Abj_weather.log
python3 fetching_data.py | grep "Port Harcourt" | cut -d "," -f2-4 | tr ")" " "  >> logs/Port_weather.log


# Buffer the last hour of readings
head -n1 < logs/Abj_weather.log > buffered_log/Abj_weather.log && tail -n10 <  logs/Abj_weather.log >> buffered_log/Abj_weather.log
head -n1 < logs/Lag_weather.log > buffered_log/Lag_weather.log && tail -n10 <  logs/Lag_weather.log >> buffered_log/Lag_weather.log
head -n1 < logs/Port_weather.log > buffered_log/Port_weather.log && tail -n10 <  logs/Port_weather.log >> buffered_log/Port_weather.log

sleep 1

cat <  buffered_log/Abj_weather.log > logs/Abj_weather.log
cat <  buffered_log/Lag_weather.log > logs/Lag_weather.log
cat <  buffered_log/Port_weather.log > logs/Port_weather.log





# Call get_stats.py to  aggregate the readings.

# Load the stats using load_stats_api

# Schedule the script to run every minutes.


