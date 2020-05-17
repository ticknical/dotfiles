export ZSHDOTDIR=~/.zsh

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -Uz compinit && compinit -u

zplug "sorin-ionescu/prezto"
zplug "zsh-users/zsh-completions"

if [[ -d "${ZSHDOTDIR}" ]]; then
    zplug "${ZSHDOTDIR}", from:local
fi

if ! zplug check --verbose; then
    zplug install
fi

zplug load

