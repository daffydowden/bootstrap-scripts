#
# Ubuntu 10.04
#
# Installs Nginx
#

aptitude update -y

aptitude install -y nginx

service nginx restart
