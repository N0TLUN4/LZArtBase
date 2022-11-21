git stash
git fetch --all
git reset --hard origin/main
git pull
git stash pop
bundle exec jekyll s --livereload --host localhost
