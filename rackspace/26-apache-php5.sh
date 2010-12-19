#
# Ubuntu 10.04
#
# Installs PHP5 on Apache
#

apt-get update -y

apt-get install -y php5 libapache2-mod-php5

# MODS="rewrite.load proxy.conf proxy.load proxy_balancer.load proxy_http.load"
# for mod in $MODS
# do
#   ln -s /etc/apache2/mods-available/$mod /etc/apache2/mods-enabled/$mod
# done

apache2ctl -k graceful