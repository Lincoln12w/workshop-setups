
# Python on Mac

[TOC]

(**DEPRECATION**: Python 2.7 will reach the end of its life on **January 1st, 2020**. Please upgrade your Python as Python 2.7 won't be maintained after that date. A future version of pip will drop support for Python 2.7.)

## Install Python

**Python 3.7.1** is pre-installed in *MacOSX 10.14.2*. To install another version of python:

``` sh
# Install the latest version of Python3 via Homebrew
brew install python3

# or download the specific version of Python from `https://www.python.org`
curl https://www.python.org/ftp/python/3.6.7/python-3.6.7-macosx10.9.pkg > python-3.6.7.pkg
```

## Basic setup

### pip

__Install__:

``` sh
sudo easy_install pip

# Configuration
#   Site-wise:  /Library/Application Support/pip/pip.conf (recommend)
#   Per-user:   $HOME/Library/Application Support/pip/pip.conf
#   Virtualenv: $VIRTUAL_ENV/pip.conf
#
#   Ubuntu:     ~/.pip/pip.conf

cat >> "$HOME/Library/Application Support/pip/pip.conf" << EOF

[global]
# Set pip default download source mirror
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
# Set default timeout value
timeout = 60
EOF

# Setup alias
cat >> ~/.zshrc << EOF

# pip alias
alias pu="pip install --upgrade"
alias pi="pip install"
alias pl="pip list"
alias pv="pip show"
alias pu_all="pip list | gawk 'NR>2{print $1}' | xargs pip install --upgrade" # update all installed packages
EOF
source ~/.zshrc
```

__[Usage](https://pip.pypa.io/en/stable/reference/)__:

``` sh
pip install <package>
pip install <package>==1.0.4 <package>>=1.0.4   # Install with vision.
pip install <package>.whl                       # Install with wheel package

pip install --upgrade <package>                 # Upgrade package
pip show [--files] <package>                    # Show package infos
pip list [--outdated]                           # List installed packages
pip uninstall <package>                         # Uninstall package
pip search <package>                            # Search a package
```

#### Packages

### [virtualenv](https://virtualenv.pypa.io/en/stable/) & [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)

__Install__:

``` sh
pip install virtualenv virtualenvwrapper

# Configure
cat >> ~/.zshrc << EOF

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
alias allpu="allvirtualenv pip install --upgrade"
alias allpi="allvirtualenv pip install"
EOF
source ~/.zshrc
```

__Usage__:

``` sh
# # Raw usage without virtualenvwrapper (Not recomend)
# virtualenv [--system-site-packages] [-p /path/to/python] <env_name>
# source ~/tensorflow/bin/activate        # Activate the environment
# ...
# deactivate                              # Return to system environment
# rm -r ~/tensorflow                      # Remove the environment

# With virtualenvwrapper (recommend)
mkvirtualenv [--system-site-packages] [-p path/to/python] [-r requirements_file] <env_name>
workon <env_name>                       # Activate the environment
...
deactivate                              # Return to system environment
rmvirtualenv <env_name>                 # remove virtualenv

lsvirtualenv                            # list all virtualenv
allvirtualenv pip install <package>     # Install for all virtualenv
```

__The `--system-site-packages` Option__

If build the environment with this, then the created environment will inherit packages from `/usr/lib/python2.7/site-packages` (or where yout global site-packages directory is).

numpy
seaborn
matplotlib
pathlib
...

### [Opencv](http://opencv.org)

__Install__:

``` sh
# brew tap homebrew/science
# brew install opencv
# mkdir -p /Users/lincoln/Library/Python/2.7/lib/python/site-packages

# # Configuration for python
# #   Site-wise:  /Users/lincoln/Library/Python/2.7/lib/python/site-packages/homebrew.pth
# #   Vierualenv: $VIRTUAL_ENV/lib/python2.7/site-packages/homebrew.pth
# cat >> /Users/lincoln/Library/Python/2.7/lib/python/site-packages/homebrew.pth << EOF

# import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")
# EOF

pip install opencv-contrib-python

# Test installation
python -c 'import cv2' 2>/dev/null && echo "Success" || echo "Failure"
```

### [PyQt](https://riverbankcomputing.com/software/pyqt/intro)

__Install__:

Download & Install [qt-unified-mac-x64-2.0.5-online.dmg](https://www.qt.io).

```sh
# Install directly via brew and pip. Only works for Python3
brew install pyqt5
pip3 install PyQt5

# Test installation
python3 -c 'import PyQt5' 2>/dev/null && echo "Success" || echo "Failure"
```

<!--
# Download & install sip
wget -O sip-4.19.1.tar.gz https://downloads.sourceforge.net/project/pyqt/sip/sip-4.19.1/sip-4.19.1.tar.gz?r=&ts=1525091562&use_mirror=jaist
tar -zxvf sip-4.19.1.tar.gz
cd sip-4.19.1
python configure.py
make & make install

# Download & install pyqt
wget -O Qt5_gpl-5.8.tar.gz https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.8/PyQt5_gpl-5.8.tar.gz?r=&ts=1525091801&use_mirror=jaist
tar -zxvf Qt5_gpl-5.8.tar.gz
cd PyQt5_gpl-5.8
python configure.py --qmake ~/Qt/5.8/clang_64/bin/qmake --sip-incdir=/path/to/sip-4.19.1/siplib
make & make install
-->

__P1: `Project ERROR: Could not resolve SDK Path for 'macosx'`.__

The online installer for Qt currently supports OSX 10.8, For OSX later than 10.8, when install sip, `Project ERROR: Could not resolve SDK Path for 'macosx'` will occur.

To solve this problem, manually select the SDK.

- Open Xcode->Preferences->Locations->command line tools..select the CLT
- Adding to the `5.8/clang_64/mkspecs/qdevice.pri` file with the following line:
  - `!host_build:QMAKE_MAC_SDK = macosx10.12`

__P2: `sip: Usage: ...` `Error: Unable to create the C++ code.`.__

If the path of `sip` contain spaces, `sip: Usage: ...` `Error: Unable to create the C++ code.` will occur.

To solve this problem, simply remove the spaces in the path.

__P3: `Permittion denied` when `cp sip /System/....`.__

When install `sip`, `make install` will try to copy sip into `/System/....`, which we do not have the permittion, even the __root__. Which is caused by __System Integrity Protection (SIP)__.

To solve this problem, temporary Disable the SIP:

- Power in Recovery Mode by press `⌘ + R`.
- Open Terminal & type `csrutil disable` to disable SIP.

## Deep learning toolkits

### [Tensorflow](https://www.tensorflow.org/) & [Keras](https://keras.io/)

`https://github.com/tensorflow/tensorflow.git`

Keras is now embedded in Tensorflow, import it by `import tensorflow.contrib.keras.api.keras`, `import tensorflow.python.keras` in 1.4.0.

**Note**, standalone Keras API and Tensorflow-embedded Keras API can not mixed together.

__Install__:

``` sh
# Install via pip command. Currently only support Python 3.5 and Python 3.6
pip install tensorflow      # CPU version
pip install tensorflow-gpu  # GPU version

# Pre-build CPU version with SSEX2
pip install https://github.com/Lincoln12w/works-on-mac/raw/master/Pre-build/tensorflow-1.3.0-cp27-cp27m-macosx_10_12_x86_64.whl

# Test installation
python -c 'import tensorflow as tf' 2>/dev/null && echo "Success" || echo "Failure"
```

__Build from source to speed up training on CPU__:

```sh  https://www.tensorflow.org/install/source
# Install Bazel
brew install bazel

#Getting bash compeletion for Bazel
cat >> ~/.zshrc << EOF

# For Bazel compeletion
source /usr/local/Cellar/bazel/0.13.0/etc/bash_completion.d/bazel-complete.bash
EOF
source ~/.zshrc

# Install python dependencies
pip install six numpy wheel mock
pip install keras_applications --no-deps
pip install keras_preprocessing --no-deps

pip install enum34

cd tensorflow
rm -rf bazel*           # Clean the workspace
git pull                # Upgrade source
./configure             # Configuration

# Build pip packages (Note that `bazel` not support http_proxy)
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

# Install pip package
sudo pip install /tmp/tensorflow_pkg/tensorflow-x.x.x.whl
```

__P1: `ImportError: cannot import name tensor_array_ops` when perform `import tensorflow`.__

To solve this problem, update the tensorflow:

``` sh
pip install tensorflow --upgrade
```

__P2: `ImportError: No module named protobuf` when perform `import tensorflow`__

To solve this problem, re-install Tensorflow:

``` sh
pip uninstall protobuf
pip uninstall tensorflow
easy_install --upgrade six
pip install tensorflow
```

__P3: `Checksum was a9a3673b1f7bd80ef563e9de1d9ccdb5126dc0cce6377977009092148993c4fe but wanted 02f5950f93c4fd3691771c07c9d04cf2999ab01383ff99da345249e93b0fcfb2 and referenced by '//tensorflow/tools/pip_package:licenses'` when perform `bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package`.__

``` sh
# Install gnu-sed
brew install --with-default-names gnu-sed

# opt 1. Remove the Github entry.
sed -i '\@"https://github.com/google/boringssl/archive/e3860009a091cd1bd2bc189cdbc3c6d095abde84.tar.gz"@d' tensorflow/workspace.bzl

# opt 2. Modify the sha256 checksum
sed -i "s/02f5950f93c4fd3691771c07c9d04cf2999ab01383ff99da345249e93b0fcfb2/a9a3673b1f7bd80ef563e9de1d9ccdb5126dc0cce6377977009092148993c4fe/g" tensorflow/workspace.bzl
```

__P4: `ImportError: dlopen(/Users/lincoln/.virtualenvs/tf-py3/lib/python3.6/site-packages/tensorflow/python/_pywrap_tensorflow_internal.so, 6): Symbol not found: _PyCObject_Type` when perform installation check.__

Some object was build on different version of python.

__P5: `AttributeError: '_NamespacePath' object has no attribute 'sort'` when perform `bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package`.__

``` sh
# Update setuptools.
pip install --upgrade setuptools
```

__P6: `ImportError: No module named platform` when perform `import tensorflow`.__

Change work directory. **Do not** run python in the build directory.

### [PyTorch](http://pytorch.org/)

__Install__:

``` sh
pip install torch torchvision

# Test installation
python -c 'import torch' 2>/dev/null && echo "Success" || echo "Failure"
```

### [Caffe2](https://caffe2.ai/)

__Install__:

``` sh
# Install dependencies
brew install automake cmake git glog
sudo -H pip install flask future glog jupyter matplotlib numpy protobuf pydot python-gflags pyyaml scikit-image scipy setuptools six tornado

# Compile and install caffe2
git clone --recursive https://github.com/caffe2/caffe2.git && cd caffe2
git submodule update --init
mkdir -p build && cd build
cmake -DUSE_CUDA=OFF ..
sudo make install

# Test installation
python -c 'import caffe2' 2>/dev/null && echo "Success" || echo "Failure"
```

[//]: # (Have not passed the cmake stage on mac)

### [MXNet](https://mxnet.incubator.apache.org/)

__Install__:

``` sh
pip install mxnet==0.11.0
brew install graphviz
pip install graphviz

# Test installation
python -c 'import mxnet' 2>/dev/null && echo "Success" || echo "Failure"
```

### Datasets

- [mnist](http://yann.lecun.com/exdb/mnist/),
- [fashion_mnist](https://github.com/zalandoresearch/fashion-mnist),
- [cifar-10](http://www.cs.toronto.edu/~kriz/cifar.html),
- [BSD300](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/bsds/),
- [BSD500](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html)
