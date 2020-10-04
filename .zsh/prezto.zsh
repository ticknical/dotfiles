#
# Prezto options
#

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'completion' \
  'directory' \
  'editor' \
  'environment' \
  'git' \
  'history' \
  'homebrew' \
  'prompt'
  'spectrum' \
  'terminal' \
  'utility' \


# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'emacs'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'paradox'
