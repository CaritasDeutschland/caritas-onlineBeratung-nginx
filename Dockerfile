FROM nginx:1.21.0

# Remove sym links from nginx image
RUN rm /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log

# Install logrotate
RUN apt-get update && apt-get -y install logrotate && apt-get -y install vim

COPY crontab /etc/crontab

# Start nginx and cron as a service
CMD service cron start && nginx -g 'daemon off;'
