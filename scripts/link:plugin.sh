watchman watch $1
rsync -zvrah $1 ./volumes/wordpress/plugins
watchman -- trigger $1 docker-wordpress-plugin-$(basename $1)-trigger '*' -- sh -c "rsync -zvrah $1 ./volumes/wordpress/plugins --exclude node_modules"
