ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache smartmontools vim apk-cron

# Copy cron file to the cron.d directory
COPY data/cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron

# Copy script
COPY data/main.sh /opt/main.sh
RUN chmod 0777 /opt/main.sh

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Create the log file to be able to run tail
CMD [ "/run.sh" ]