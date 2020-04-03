# ./docker/web/Dockerfile
# Base image:
FROM openresty/openresty:xenial
# Install dependencies
RUN apt-get update -qq && apt-get -y install apache2-utils nano

# establish where Nginx should look for files
ENV RAILS_ROOT /var/www/app

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# create log directory
RUN mkdir /log

# Copy Nginx config template
COPY nginx.conf /tmp/docker.nginx

# substitute variable references in the Nginx config template for real values from the environment
# put the final config in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

COPY entrypoint_nginx.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint_nginx.sh

ENTRYPOINT ["entrypoint_nginx.sh"]

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
