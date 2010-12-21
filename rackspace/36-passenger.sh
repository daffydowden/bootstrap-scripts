#
# Ubuntu 10.04
#
# Installs Phusion Passenger (mod_rails). 
# Also adds a user called "app" that your Rails application runs as
#

PASSENGER_VER=3.0.1

if [ ! -n "$SERVERNAME" ]
then 
  echo "Must set 'ServerName' for Apache"
  echo "export SERVERNAME=example.com"
  exit
fi

# Install Passenger to global gemset
# Should already be using global, but just in case
rvm gemset use global

export USERNAME=app
bash add_user.sh
gem install passenger -v $PASSENGER_VER

# Reload .bashrc
source ~/.bashrc

#Install Passenger Module
passenger-install-apache2-module -a

echo "\
# Phusion Passenger Details
ServerName $SERVERNAME

LoadModule passenger_module $GEM_HOME/gems/passenger-$PASSENGER_VER/ext/apache2/mod_passenger.so
PassengerRoot $GEM_HOME/gems/passenger-$PASSENGER_VER
PassengerRuby $rvm_path/wrappers/$(echo $(rvm-prompt))/ruby
" >> /etc/apache2/apache2.conf