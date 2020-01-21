

``` shell
# General dependencies

brew install -vd snappy leveldb gflags glog szip lmdb
# need the homebrew science source for OpenCV and hdf5
brew tap homebrew/science
brew install hdf5 opencv

# Remaining dependencies, with Python
# with Python pycaffe needs dependencies built from source
brew install --build-from-source --with-python -vd protobuf
brew install --build-from-source -vd boost boost-python
```
