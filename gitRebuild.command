#! /bin/sh
#
# gitRebuild.command --- replace the .git folder with a fresh copy
#
# When your git history is seriously messed up, but you don't want to lose your changes and you're not enough of a dweeb to know how to fix it. 
#
# You're welcome. 
#
# By Oscar Nierstrasz
# 2015-03-22 -- first completely automated version 
#
# https://github.com/onierstrasz/gitrebuild/

# This script should be run directly from the root of a cloned git repo
D=$(dirname "$0")
cd "$D" || exit

if test ! -d .git
then
	echo "Not a git repo"
	exit
fi

# Extract the location of the git repo from the configuration
U=$(fgrep 'url =' .git/config | sed 's/.*url = //')


# Clone the repo again to a temporary folder
T=tmp$$
git clone "$U" $T

# Replace the current git history (.git folder) with the fresh one
rm -rf .git
mv $T/.git .

# Clean up
rm -rf $T

exit
