## GLOG, GFlags, GTest
sudo apt-get install libgoogle-glog-dev libgflags-dev libgtest-dev

cd /usr/src/gtest
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo cp libgtest* /usr/lib/
cd ..
sudo rm -rf build

git clone https://github.com/gflags/gflags
cd gflags
mkdir build && cd build
cmake ..
make -j4
sudo make install

## openimageio, opengl, et.
sudo apt-get install libopenimageio1.6 libopenimageio-dev
sudo apt-get install freeglut3 freeglut3-dev libglew-dev
sudo apt-get install libxmu-dev libxi-dev
sudo apt-get install libopenexr-dev

## Eigen 3
hg clone https://bitbucket.org/eigen/eigen
mkdir eigen_build && cd eigen_build
cmake . ../eigen
make && sudo make install
cd ..

## Ceres-Solver
sudo apt-get install libatlas-base-dev libsuitesparse-dev
git clone https://github.com/ceres-solver/ceres-solver.git
cd ceres-solver
git checkout $(git describe --tags) # Checkout the latest release
mkdir build
cd build
cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
make -j8
sudo make install

## install rocksdb(required by TheiaSfM)
git clone https://github.com/facebook/rocksdb
cd rocksdb
git checkout v5.9.2
make -j8 shared_lib
sudo make install
sudo cp /usr/local/lib/librocksdb.* /usr/lib

## install rapidjson
git clone https://github.com/Tencent/rapidjson.git
git submodule update --init
mkdir build && cd build
cmake ..
make -j8

## build && install TheiaSfM
git clone https://github.com/sweeneychris/TheiaSfM.git
cd TheiaSfM
mkdir build && cd build
cmake ..
make -j8
make test
sudo make install