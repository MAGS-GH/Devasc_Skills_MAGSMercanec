# Use the official Apache image as the base image
FROM httpd:latest

# Uncomment the line to enable the rewrite module in Apache configuration
RUN sed -i '/rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Change Apache listening port to 8088
RUN sed -i 's/Listen 80/Listen 8088/' /usr/local/apache2/conf/httpd.conf

# Copy the custom index.html to Apache root folder
COPY ./files/index.html /usr/local/apache2/htdocs/index.html

# Expose port 8088
EXPOSE 8088