FROM centos:7
MAINTAINER Carlos Poveda <krpovmu@gmail.com>

# Install repo and packages
RUN curl -L http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm > /tmp/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN rpm -Uvh /tmp/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx

# Create log and config folders
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled

# Add configuration files
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/phoenix.conf /etc/nginx/sites-available/phoenix.conf
ADD config/phoenix.inc /etc/nginx/conf.d/apigility.inc

# Add config to sites enabled
RUN ln -s /etc/nginx/sites-available/phoenix.conf /etc/sites-enabled/phoenix.conf

# Default command
CMD ["nginx"]

# Expose ports
EXPOSE 80
