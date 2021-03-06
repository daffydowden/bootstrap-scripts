#
# Ubuntu 10.04
#
# Installs ImageMagick. Installs rmagick gem if Rubygems is installed
#

aptitude update -y

aptitude install -y imagemagick libmagick9-dev 

if [ -e "`which gem`" ]
then
  gem install rmagick
fi
