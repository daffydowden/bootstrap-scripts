#
# Ubuntu 10.04 - Lucid
#
# Installs a system wide version of RVM with ruby 1.9.2
#

# Resynchronise the package index from sources (/etc/apt/sources.list)
apt-get update -y

# Install the following:
# libssl-dev - development files for OpenSSL
# libreadline5-dev - Aids consistency of UI across CLI programs
# zlib1g-dev - deflate compression library support
apt-get install -y libssl-dev libreadline5-dev zlib1g-dev

# Download RVM and install.
bash < <( curl -L http://bit.ly/rvm-install-system-wide )

# Add user to RVM group
usermod -a -G rvm richard
usermod -a -G www-data richard

# RVM scripts
cd ~
echo 'if [[ -s "/usr/local/lib/rvm" ]]  ; then source "/usr/local/lib/rvm" ; fi' >> .bashrc
echo 'if [[ -s "/usr/local/lib/rvm" ]]  ; then source "/usr/local/lib/rvm" ; fi' >> /home/richard/.bashrc

# Install default ruby
rvm install 1.9.2 --default

echo 'Installed Ruby version'
ruby -v

# Create and use the global gemset
rvm use 1.9.2@global --create
rvm info
# Install Bundler
gem install bundler
