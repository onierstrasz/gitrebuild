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

D=`dirname "$0"`
cd "$D"

if test ! -d .git
then
	echo "Not a git repo"
	exit
fi

U=`fgrep 'url =' .git/config | sed 's/\s*url = //'`
T=tmp$$

git clone $U $T
rm -rf .git
mv $T/.git .
rm -rf $T

exit
