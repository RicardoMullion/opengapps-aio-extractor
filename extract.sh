#!/bin/bash
echo "start extract opengapps package"
unzip *.zip -d org
rm -rf tmp > /dev/null 2>&1
mkdir -p tmp
find . -name "*.tar.xz" -exec tar -xf {} -C tmp/ \;
rm -rf sys > /dev/null 2>&1
mkdir -p system
for dir in tmp/*/
do
  pkg=${dir%*/}
  dpi=$(ls -1 $pkg | head -1)

  echo "  - including $pkg/$dpi"
  rsync -aq $pkg/$dpi/ system/
done
echo "extract system folder done"
