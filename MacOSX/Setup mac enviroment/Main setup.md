# Main Setup

[TOC]

## Some Special key on mac

⌘（command）、⌥（option）、⇧（shift）、⇪（capslock）、⌃（control）、↩（return）

## [Go2Shell](http://zipzapmac.com/Go2Shell)
[//]: # (https://itunes.apple.com/us/app/go2shell/id445770608?mt=12)

__Install__:

Press `⌘` & drag the Go2Shell application into Finder's menu bar.

``` sh
# Open configuration setting
open -a Go2Shell --args config
```

__Usage__:

Click the Go2Shell to Open the current directory in Terminal.

## [oh-my-zsh](https://ohmyz.sh/)

__Install__:

```sh
sh  -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## [HomeBrew](http://brew.sh)

__Install__:

``` sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Configuration
# Change the default download source mirror
cd /usr/local/Homebrew/
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git

cd /usr/local/Library/Taps/homebrew/homebrew-core
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git

echo >> ~/.zshrc << EOF

# Homebrew mirror
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
EOF
sourch ~/.zshrc
```

- Usage

``` sh
brew install xxx
```

### Install gnu-sed

``` sh
brew install --with-default-names gnu-sed
```

### Highlight `cat`

``` sh
brew install source-highlight

cat >> ~/.zshrc << EOF

# alias for cat highlight
alias color-cat="source-highlight --out-format=esc -o STDOUT -i"
EOF
source ~/.zshrc
```

## Enable access to `/home`

``` sh
sudo sed -i 's/\/home/#\/home/' /etc/auto_master
sudo automount -vc
```
