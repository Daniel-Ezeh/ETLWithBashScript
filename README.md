 - TASK
Report weather condition for a remote location.

Hourly averagge, minimum and maximum temperature.

Remote Temperature sensor.

Update every minute.


* WORKFLOW

- EXTRACTION

get_temp_API
Append the reading to a log file
Buffer the last 60 reading.
Over write the log file with the buffered reading.

TRANSFORMATION
Call a python file that will get the value from the log file.
Calculate the extracted data and get metrics.


LOADING
Create an API that loads the results into a dashboard.
 
Schedule the Workflow to run every minute.

