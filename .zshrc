export ZSHDOTDIR=~/.zsh

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -Uz compinit && compinit -u

zplug "sorin-ionescu/prezto"
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/prompt", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/utility", from:prezto

zplug "zsh-users/zsh-completions"

if [[ -d "${ZSHDOTDIR}" ]]; then
    zplug "${ZSHDOTDIR}", from:local
fi

if ! zplug check --verbose; then
    zplug install
fi

zplug load
