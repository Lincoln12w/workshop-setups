# Compile opencv

```sh
# Install compile tools
brew install cmake pkg-config
# Install image reader
brew install jpeg libpng libtiff openexr
#
brew install eigen tbb
```

```sh
wget https://github.com/opencv/opencv/archive/4.0.0-alpha.tar.gz -O opencv.tar.gz
wget https://github.com/opencv/opencv_contrib/archive/4.0.0-alpha.tar.gz -O opencv_contrib.tar.gz

tar -zxvf opencv.tar.gz opencv_contrib.tar.gz
```

```sh
brew install gstreamer
```

```sh
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D PYTHON3_PACKAGES_PATH=~/.virtualenvs/cv_build/lib/python3.7/site-packages \
      -D PYTHON3_LIBRARY=/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib \
      -D PYTHON3_INCLUDE_DIR=/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/include/python3.7m \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D BUILD_EXAMPLES=ON \
      -D BUILD_opencv_python3=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules ..

make -j4
make install
```
