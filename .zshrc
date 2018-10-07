export ZSH="/Users/lxspandora/.oh-my-zsh"

plugins=(… zsh-completions)
autoload -U compinit && compinit

export NVM_DIR=~/.nvm
export PATH=~/flutter/bin:$PATH
# export ZSH_THEME=robbyrussell
export ANDROID_HOME=~/Library/Android/sdk
export l="exa -l --git"
export REACT_EDITOR=atom

alias cleos='docker exec -it eosio /opt/eosio/bin/cleos -u http://178.128.76.161:8888 --wallet-url http://0.0.0.0:8888'

alias keosd="docker run --rm --name eosio -d -p 8888:8888 -p 9876:9876 -v /tmp/work:/work -v /tmp/eosio/data:/mnt/dev/data -v /tmp/eosio/config:/mnt/dev/config eosio/eos-dev  /bin/bash -c 'keosd --http-server-address=0.0.0.0:8888'"

source $(brew --prefix nvm)/nvm.sh
plugins=(
  git
)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

export PATH="/Users/lxspandora/.nvm/versions/node/v8.11.3/bin:/Users/lxspandora/flutter/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/lxspandora/.vimpkg/bin"

ZSH_THEME="simple"

PROMPT='%{$fg_bold[blue]%}%~ %{$fg_bold[green]%}⬢ $(node -v) %{$fg_bold[magenta]%} $(git_prompt_info)%{$reset_color%} ~ '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
