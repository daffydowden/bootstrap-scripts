#
# Ubuntu 10.04 Lucid
#
# Installs miscellaneous packages (Ubuntu / Rubygems)
#

# Resynchronise the package index from sources (/etc/apt/sources.list)
aptitude update -y

# Installs the following:
# locate - generates index of files and directories
# Git - dVCS and docs
# tree - displays indented directory tree
# vim-nox - vim editor without GUI
# byobu - screen profiles for GNU window manager
# nmap - network utility for exploration and security auditing
# sqlite3 - light-weight SQL database engine and development files
# libxml2 - wrapper to handle xml files and development files
# libxslt1.1 - XSLT transformations and development files
aptitude install -y locate git-core git-doc tree vim-nox byobu nmap sqlite3 libsqlite3-dev libxml2 libxml2-dev libxslt1.1 libxslt1-dev 

# Updates the file name database used by locate
updatedb

# Update Ruby Gems
# gem update

#gem install rake hpricot rack libxml-ruby nokogiri
