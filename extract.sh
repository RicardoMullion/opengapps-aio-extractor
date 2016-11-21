#!/bin/bash
echo "start extract opengapps package"
unzip "gapps/*.zip" -d "gapps/pkg"
rm -rf gapps/tmp > /dev/null 2>&1
mkdir -p gapps/tmp
find . -name "*.tar.[g|l|x]z" -exec tar -xf {} -C gapps/tmp/ \;
rm -rf gapps/system > /dev/null 2>&1
mkdir -p gapps/system
for dir in gapps/tmp/*/
do
  pkg=${dir%*/}
  dpi=$(ls -1 $pkg | head -1)
  echo "  - including $pkg/$dpi"
  rsync -aq $pkg/$dpi/ gapps/system/
done
# no leftovers
rm -rf gapps/tmp
echo "extract system folder done"
