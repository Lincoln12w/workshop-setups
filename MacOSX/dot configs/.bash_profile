# Terminal color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\u@mbp:\W\$"

# # XX_NET Wall Breaker
# export http_proxy="127.0.0.1:8087"
# export https_proxy="127.0.0.1:8087"
# export HTTP_PROXY="127.0.0.1:8087"
# export HTTPS_PROXY="127.0.0.1:8087"

# cat highlight
alias cat="source-highlight --out-format=esc -o STDOUT -i"

alias rm="rm -i"
alias pip="sudo pip"
alias findall="sudo find /"

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/openssl/1.0.2j/bin/openssl"

# brew source mirror
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# bazel completion
source /usr/local/Cellar/bazel/0.5.4/etc/bash_completion.d/bazel-complete.bash

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
alias allpu="allvirtualenv pip install --upgrade"
alias allpi="allvirtualenv pip install"

# alias for cat highlight
alias cat="source-highlight --out-format=esc -o STDOUT -i"
