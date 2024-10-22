#!/usr/bin/env bash

( set -o posix ; set ) | grep -i bash
exit

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "dir: $DIR"

cd "$DIR" || exit

file_name="smtp-info-test";
release_dir="../release";

cd ../

composer dump-autoload

cd "$DIR" || exit 1

php -d phar.readonly=0 ./create-phar.php

path="${release_dir}/${file_name}.phar"

if [ -f "$path" ]; then
  chmod +x "$path"
  echo "Copying smtp-info-test to your PATH"
  cp ../release/smtp-info-test.phar /usr/local/bin/smtp-info-test
  smtp-info-test --help
else
  echo "Build failed" 1>&2
fi

