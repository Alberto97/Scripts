#!/bin/bash
# syntax: . upload.sh falcon
# Build Script by JosegalRe, Please read this script, before use
# Only for PAC, run this file ==> ./build.sh

# Root folder of sources ==> /home/josegalre/Android
#user="/home/$USER/Android"
user="/home/$USER"

# Specific source, in this case, Pacman ==> /home/josegalre/Android/pac-4.4
#build="$user/pac-4.4"
build="$user/aosp"

# Server settings
buser="YOUR_USERNAME"    # Example: buser="harry"
bpass="YOUR_PASSWORD"    # Example: bpass="AvadaKedavra"
bserver="s.basketbuild.com"  # Example: bserver="s.basketbuild.com"

bdevice=$1
bout="${build}/out/target/product/${bdevice}"

# Upload files to basketbuild
# make sure the directory remote directory exists, Example: /${x}/${btype} ==> /ruby/weekly
# Need these packages ==> ncftp
# Install ==> sudo apt-get install ncftp
echo "Uploading rom to Basketbuild of ${buser}"

# Get time of upload startup
ut1=$(date +%s)

# Upload md5sum
ncftpput -v -u "${buser}" -p "${bpass}" ${bserver} /${bdevice}/F-AOSP/5.1/CAF ${bout}/AOSP*.md5sum

# Upload zip
# is possible that after sending the zip,
# the terminal does nothing, This takes about 120 seconds, then continuing with the tasks
# if the terminal says: "could not send file to remote host"
# Please check md5sum, the file transfer was successful, the error message may be a false positive
ncftpput -v -u "${buser}" -p "${bpass}" ${bserver} /${bdevice}/F-AOSP/5.1/CAF ${bout}/AOSP*.zip

# Get time of upload finish
ut2=$(date +%s)
utm=$(((ut2-ut1)/60))
uts=$(((ut2-ut1)%60))
echo "Upload in: $utm minutes $uts seconds"
