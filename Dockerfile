FROM ubuntu:latest

# Install cron
RUN apt-get update && apt-get install -y cron

# Copy crontab file to container
COPY crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Create log file to output cron job results
RUN touch /var/log/cron.log

# Run the cron job and log output to /var/log/cron.log
CMD cron && tail -f /var/log/cron.log