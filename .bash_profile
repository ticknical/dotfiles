# Load bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Load bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# export PATH
export PATH="/usr/local/bin:$HOME/bin:$PATH"
