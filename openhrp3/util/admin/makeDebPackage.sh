#!/bin/bash
CURRENT_DIR=${PWD}
cd ${0%/*}
WORK_DIR=${PWD}
PACKAGES_DIR='util/admin/deb'

# Set dsitribution code name
if [ -z $1 ]; then 
  source /etc/lsb-release
else
  DISTRIB_CODENAME=$1
fi

cd ../../

# Delete files
sudo rm -rf _CPack_Packages install_manifest.txt util/admin/ubuntu


# Generate development deb file
#cmake -D DEBIANPACKAGE_DEVELOP:BOOL=ON -D GENERATE_DEBIANPACKAGE:BOOL=ON .
cmake -D GENERATE_DEBIANPACKAGE:BOOL=ON -D CMAKE_INSTALL_PREFIX:STRING=/usr .
sudo cpack -G DEB
#   Generate runtime deb file
#cmake -D DEBIANPACKAGE_DEVELOP:BOOL=OFF -D GENERATE_DEBIANPACKAGE:BOOL=ON .
#sudo cpack -G DEB

if [ ! -d ${PACKAGES_DIR} ]; then
  mkdir -p ${PACKAGES_DIR}
fi

sudo mv -f *.deb ${PACKAGES_DIR}

DEB_FILES=`ls ${PACKAGES_DIR}/*.deb`


cmake -D GENERATE_DEBIANPACKAGE:BOOL=OFF -D CMAKE_INSTALL_PREFIX:STRING=/usr/local .
cd ${WORK_DIR}
DEST_DIR="ubuntu/dists/${DISTRIB_CODENAME}/main/binary-i386/"

if [ ! -d ${DEST_DIR} ]; then
  mkdir -p ${DEST_DIR}
fi

for name in ${DEB_FILES}
do
  sudo cp ../../${name} ${DEST_DIR}
done

./makeDebPackageInfo.sh ubuntu dists/${DISTRIB_CODENAME}/main/binary-i386/

cd ${CURRENT_DIR}
