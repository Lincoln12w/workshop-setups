# Main Setup

[TOC]

Some Special key on mac: ⌘(command) | ⌥(option) | ⇧(shift) | ⇪(capslock) | ⌃(control) | ↩(return) | ⇥(tab)

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
```

or

```sh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## [HomeBrew](http://brew.sh)

__Install__:

``` sh
/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)

# Configuration
# Change the default download source mirror
cd $(brew --repo)
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
cd $(brew --repo)/Library/Taps/homebrew/homebrew-core
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
# Update cask softwarex source mirror
cd $(brew --repo)/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# Update bottles source mirror
cat >> ~/.zshrc << EOF

# Homebrew mirror
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# Disable update homebrew before install softwares
export HOMEBREW_NO_AUTO_UPDATE=true
EOF
source ~/.zshrc

brew update
```

- Usage

``` sh
brew install xxx
```

### Install gnu-sed

``` sh
brew install gnu-sed
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
