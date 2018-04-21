# Script generated with Bloom
pkgdesc="ROS - <p>This package does not only wrap <a href="http://www.openrtp.jp/openhrp3/en/index.html">OpenHRP3</a> but actually provides the built artifact from the code from its <a href="https://openrtp.jp/svn/hrg/openhrp">mainstream repository</a>. Being ROS-agnostic by itself, you can also use this via ROS together with the packages in <a href="http://www.ros.org/wiki/rtmros_common">rtmros_common</a> that bridge between two framework.</p> <p><i>OpenHRP3 (Open Architecture Human-centered Robotics Platform version 3) is an integrated software platform for robot simulations and software developments. It allows the users to inspect an original robot model and control program by dynamics simulation. In addition, OpenHRP3 provides various software components and calculation libraries that can be used for robotics related software developments</i> (<a href="http://www.openrtp.jp/openhrp3/en/about.html">excerpts from here</a>). </p> <p>The package version number is synchronized to that of mainstream, based on <a href="http://code.google.com/p/rtm-ros-robotics/issues/detail?id=165#c5">this decision</a>.</p>"
url='https://openrtp.jp/svn/hrg/openhrp/'

pkgname='ros-kinetic-openhrp3'
pkgver='3.1.9_4'
pkgrel=1
arch=('any')
license=('EPL'
)

makedepends=('atlas-lapack'
'boost'
'cmake'
'collada-dom'
'doxygen'
'eigen3'
'f2c'
'jython'
'libjpeg-turbo'
'libpng'
'libxml2'
'omniorbpy'
'pkg-config'
'ros-kinetic-openrtm-aist'
)

depends=('atlas-lapack'
'boost'
'collada-dom'
'eigen3'
'f2c'
'jython'
'libjpeg-turbo'
'libpng'
'libxml2'
'omniorbpy'
'ros-kinetic-openrtm-aist'
)

conflicts=()
replaces=()

_dir=openhrp3
source=()
md5sums=()

prepare() {
    cp -R $startdir/openhrp3 $srcdir/openhrp3
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

