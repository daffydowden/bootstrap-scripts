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
rvm gemset use global

export USERNAME=app
bash add_user.sh
gem install passenger -v $PASSENGER_VER
passenger-install-apache2-module -a

echo "\
ServerName $SERVERNAME

LoadModule passenger_module /usr/local/rvm/gems/ruby-1.9.2-p0@global/gems/passenger-$PASSENGER_VER/ext/apache2/mod_passenger.so
PassengerRoot /usr/local/rvm/gems/ruby-1.9.2-p0@global/gems/passenger-$PASSENGER_VER
PassengerRuby /usr/local/rvm/wrappers/ruby-1.9.2-p0@global/ruby
" >> /etc/apache2/apache2.conf


/usr/local/rvm/gems/ruby-1.9.2-p0@global/gems/passenger-3.0.1/ext/apache2/mod_passenger.so
/usr/local/rvm/gems/ruby-1.9.2-p0@global/gems/passenger-3.0.1/ext/apache2