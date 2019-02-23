#!/bin/bash
#
# Descriptor:
#	Setup Ubuntu on scrash
#
# Modify History
# --------------
# 00a Feb 22, 2019 lzw create

create_new_user()
{
    username=$1
    adduser $username
    chusr $username /home/$username
    chgrp $username /home/$username
}

install_zsh()
{
    sudo apt-get install -y zsh git
    # Install oh-my-zsh
    sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    sudo chown $(whoami) ~/.zshrc

    # Set zsh the default bash
    # sudo chsh -s $(which zsh)
    sudo usermod -s $(which zsh) $(whoami)
}

install_python36()
{
    sudo add-apt-repository ppa:jonathonf/python-3.6
    # incase "*** Error in `appstreamcli': double free or corruption (fasttop): 0x..... ***"
    sudo apt-get purge libappstream3
    sudo apt-get update
    sudo apt-get install -y python3.6

    # Set python3 the default python
    sudo update-alternatives --install $(which python) python $(which python3.6) 100

    # Install pip
    sudo apt-get install -y python3-pip

    cat >> ~/.zshrc << EOF
alias pip=pip3
EOF
    source ~/.zshrc
}

install_filesystem_support()
{
    ## ntfs
    sudo apt-get install ntfs-3g
    ## exfat
    sudo apt-get install exfat-fuse exfat-utils
}

install_teamviewer()
{
    # Download from the official website
    # curl https://download.teamviewer.com/download/linux/teamviewer_amd64.deb | awk 'BEGIN{FS="\""}NR==2{print $2}' | xargs curl -v 2>&1 | grep https | awk '{print $3}' | awk '{sub(/.$/,"")3}' | xargs curl -o teamviewer.deb

    sudo dpkg -i teamviewer.deb
    # incase " dpkg: dependency problems prevent configuration of teamviewer: "
    sudo apt-get install -fy
    sudo dpkg -i teamviewer.deb
}

install_vscode()
{
    # Download from the official website
    # curl https://vscode.cdn.azure.cn/stable/1b8e8302e405050205e69b59abb3559592bb9e60/code_1.31.1-1549938243_amd64.deb > vscode.deb
    sudo dpkg -i vscode.deb
    # incase " dpkg: dependency problems prevent configuration of teamviewer: "
    sudo apt-get install -fy
    sudo dpkg -i vscode.deb

    # Install the `Setting Sync` extension & sync the saved extension settings
}

install_linuxbrew()
{
    sudo apt-get install build-essential curl file git
    # https://linuxbrew.sh/
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

    # Add path
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.zshrc
}


install_zsh
install_python36
install_filesystem_support
# install_teamviewer
# install_vscode


# pip

# rom pip import main
# if __name__ == '__main__':
#     sys.exit(main())

# from pip import __main__
# if __name__ == '__main__':
#     sys.exit(__main__._main())


## virtualenv

sudo pip install virtualenv virtualenvwrapper

cat >> ~/.zshrc << EOF
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /home/$(whoami)/.local/bin/virtualenvwrapper.sh
EOF

# mkdir $HOME/.virtualenvs
source ~./zshrc

## create a virtual environment

mkvirtualenv mri

cat > pkgs.list << EOF
numpy
keras
tensorflow-gpu
xlrd
xlwt
xlutils
nipy
matplotlib==2.2.3
seaborn
EOF

pip install -r pkgs.list
