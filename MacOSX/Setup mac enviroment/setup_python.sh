#!/bin/bash
#
# Descriptor:
#	Prepare Python environment on MAC OSX
#
# Modify History
# --------------
# 00a 12oct17 lzw create
# 01a 18feb19 lzw update

# Install pip
sudo easy_install pip

# Setup source mirror
cat >> "$HOME/Library/Application Support/pip/pip.conf" << EOF

[global]
# Set pip default download source mirror
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
# Set default timeout value
timeout = 60
EOF

# Install virtual environment for Python
pip install virtualenv virtualenvwrapper

cat >> ~/.zshrc << EOF

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
alias allpu="allvirtualenv pip install --upgrade"
alias allpi="allvirtualenv pip install"
EOF
source ~/.zshrc

# Create a virtualenv for tensorflow
mkvirtualenv -p $(which python3) -r tensorflow.list tf
workon tf

# Install packages
pip install opencv-contrib-python   # Install opencv
pip install numpy
pip install matplotlib
pip install seaborn
pip install keras
pip install tensorflow
