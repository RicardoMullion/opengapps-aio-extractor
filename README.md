# opengapps-aio-extractor
this all in one script will extract the opengapps .zip file and also the .tar.xz files inside and create a correct system folder which can push via adb
# how to use
first clone the script
```
git clone https://github.com/bjsiu/opengapps-aio-extractor.git gappsextract
cd gappsextract
```
then download the opengapps (.zip) file and place into the gappsextract folder
run the extract.sh
```
./extract.sh
```
finally a system folder is created and you can push it into your system partition
```
adb push system /system
```
