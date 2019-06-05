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
    sudo adduser $username
    sudo chown $username /home/$username
    sudo chgrp $username /home/$username

    # Add user into sudoers
    # sudo passwd root
    # su root
    # sudo chmod u+w /etc/sudoers
    # sudo chmod u-w /etc/sudoers
}

install_others()
{
    # For ifconfig
    sudo apt-get install -y net-tools
    sudo apt-get install -y vim
}

# sudo /etc/sudoers is world writable
# pkexec chmod 0440 /etc/sudoers

install_zsh()
{
    sudo apt-get install -y zsh git curl
    # Install oh-my-zsh
    sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    sudo chown $(whoami) ~/.zshrc
    sudo chmod a+w ~/.zshrc

    # Set zsh the default bash, reboot needed.
    # sudo chsh -s $(which zsh)
    sudo usermod -s $(which zsh) $(whoami)
}

install_filesystem_support()
{
    ## ntfs
    sudo apt-get install ntfs-3g
    ## exfat
    sudo apt-get install exfat-fuse exfat-utils
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

install_python36()
{
    sudo add-apt-repository ppa:jonathonf/python-3.6
    # incase "*** Error in `appstreamcli': double free or corruption (fasttop): 0x..... ***"
    sudo apt-get purge libappstream3
    sudo apt-get update
    sudo apt-get install -y python3.6

    # Set python3.6 as the default python
    sudo update-alternatives --install /usr/bin/python python $(which python3.6) 100

    # Install pip
    sudo apt-get install -y python3-pip

    # Incase 'pip error'
    # Modify
    # ``` py
    # from pip import main
    # if __name__ == '__main__':
    #     sys.exit(main())
    # ```
    # To
    # ``` py
    # from pip import __main__
    # if __name__ == '__main__':
    #     sys.exit(__main__._main())
    # ```

    cat >> ~/.zshrc << EOF
alias pip=pip3
EOF
    source ~/.zshrc
}

install_mri_env()
{
    cat >> "$HOME/.pip/pip.conf" << EOF

[global]
# Set pip default download source mirror
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
# Set default timeout value
timeout = 60
EOF

    ## virtualenv
    pip install virtualenv virtualenvwrapper

    cat >> ~/.zshrc << EOF
export PATH=$PATH:${HOME}/.local/bin
export WORKON_HOME=${HOME}/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source ${HOME}/.local/bin/virtualenvwrapper.sh
EOF

    # mkdir $HOME/.virtualenvs
    source ~/.zshrc

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
}

install_deb_file()
{
    deb_file=$1

    sudo dpkg -i ${deb_file}
    # incase " dpkg: dependency problems prevent configuration of $deb_file: "
    sudo apt-get install -fy
    sudo dpkg -i ${deb_file}
}

# Reboot needed.
install_sogou_input()
{
    # curl http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb?st=T4zAP86s2ngr9jJRHtBzPg&e=1557846981&fn=sogoupinyin_2.2.0.0108_amd64.deb > sogou.deb
    install_deb_file sougou.deb
}

install_teamviewer()
{
    # curl https://download.teamviewer.com/download/linux/teamviewer_amd64.deb | awk 'BEGIN{FS="\""}NR==2{print $2}' | xargs curl -v 2>&1 | grep https | awk '{print $3}' | awk '{sub(/.$/,"")3}' | xargs curl -o teamviewer.deb
    install_deb_file teamviewer.deb
}

install_vscode()
{
    # curl https://vscode.cdn.azure.cn/stable/1b8e8302e405050205e69b59abb3559592bb9e60/code_1.31.1-1549938243_amd64.deb > vscode.deb
    install_deb_file vscode.deb

    # Install the `Setting Sync` extension & sync the saved extension settings
    #     GitHub Token: 20ca9f05636cdd10419be2cfa79b949cfc42d00c
    #     GitHub Gist: 0df2468584758773a36e8d44cfad8c16
}



install_zsh
install_python36
install_filesystem_support
# install_teamviewer
# install_vscode
