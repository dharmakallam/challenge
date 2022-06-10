# Nginx with tag 'latest' base image from Docker 
FROM nginx:latest

# Adding custom index.html to nginx html path
ADD index.html usr/share/nginx/html/

# Adding read permissions to custom index.html
RUN chmod +r /usr/share/nginx/html/index.html
