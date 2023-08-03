watchman watch $1
rsync -zvrah $1 ./volumes/wordpress/themes --exclude 'node_modules'
watchman -- trigger $1 docker-wordpress-theme-$(basename $1)-trigger '*' -- sh -c "rsync -zvrah $1 ./volumes/wordpress/themes --exclude node_modules"

