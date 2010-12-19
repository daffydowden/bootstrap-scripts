#
# Ubuntu 10.04
#
# Installs mongrel.
# Also adds a user called "app" that your Rails application runs as
#

export USERNAME=app
sh add_user.sh
gem install mongrel mongrel_cluster 