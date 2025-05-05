source ~/.bash_profile;

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# #######
# thefuck
# #######
#
# The `thefuck` command is a tool that automatically corrects errors in previous terminal commands. It works by analyzing the last command you ran, identifying potential mistakes, and suggesting or executing a corrected version of the command.
#
# For example:
# ```bash
# $ git comit -m "fix typo"
# git: 'comit' is not a git command. See 'git --help'.
#
# $ fuck
# git commit -m "fix typo"
# eval "$(thefuck --alias)"
