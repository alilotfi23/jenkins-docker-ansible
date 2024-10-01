# Use a smaller base image for efficiency and reduce image size
FROM centos:7

# Set metadata for the image
LABEL maintainer="ali.lotfi.linux@gmail.com"

# Update package lists and install necessary packages in a single step
RUN yum -y update && \
    yum -y install httpd zip unzip && \
    yum clean all

# Add the website content to the container
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the website content and clean up unnecessary files
RUN unzip photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for web traffic
EXPOSE 80
