watchman watch-del $1
rm -rf ./volumes/wordpress/themes/$(basename $1)
