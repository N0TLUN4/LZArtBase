#!/bin/bash
set -e

rm -rfv _site/*

sshfs root@server2:/var/www/lzart _site

today=$(date)

JEKYLL_ENV="production" bundle exec jekyll build

umount ./_site

ssh root@server2 fixwww.sh

ssh root@server2 "service nginx restart"

git add .
git commit -a -m "SYNC - $today"
git push
