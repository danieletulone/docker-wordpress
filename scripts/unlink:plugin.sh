watchman watch-del $1
rm -rf ./volumes/wordpress/plugins/$(basename $1)
