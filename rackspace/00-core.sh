#
# Ubuntu 10.04 Lucid
#
# Installs core development packages and users
#

# Resynchronise the package index from sources (/etc/apt/sources.list)
apt-get update -y

# Installs the basics
# build-essentails - for building debian packages
# gcc - GNU C Compiler
# g++ - GNU C++ Compiler
apt-get install -y build-essential gcc g++

# setup timezone to London
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

# add user, add this user to sudoers
export USERNAME=richard
sh add_user.sh
echo "$USERNAME\tALL=(ALL) ALL" >> /etc/sudoers

# Make the .ssh folder in home directory
# create authkeys files, set correct permissions
cd ~
mkdir -p .ssh
touch .ssh/authorized_keys
chmod 700 .ssh/
chmod 600 .ssh/authorized_keys

echo 
echo "Copying authorized_keys"
echo

# TODO Use relative paths instead of absolute. dirname? pwd? 
cp ~/bootstrap-scripts/config/root_authorized_keys ~/.ssh/authorized_keys

echo
echo "For security reasons, you must manually set a password for the 'admin' user."
echo