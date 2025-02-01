export ZSHDOTDIR=~/.zsh

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

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
