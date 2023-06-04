# syntax=docker/dockerfile:1

FROM python:3.9.16-buster

RUN apt-get update
RUN apt-get -y install cron dos2unix

WORKDIR /usr/src

COPY . .

RUN dos2unix /usr/src/start.sh
RUN dos2unix /usr/src/cron.sh

RUN pip install --editable .

RUN touch /var/log/cron.log

# Set script permissions
RUN chmod 777 /usr/src/start.sh
RUN chmod 777 /usr/src/cron.sh

# Add cron command
RUN echo "*/5 * * * * root /usr/src/cron.sh >> /var/log/cron.log 2>&1" >> /etc/crontab

CMD ["/usr/src/start.sh"]
