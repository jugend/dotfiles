# To trace script performance
# set -x
# PS4='+\t '

# Auto append homebrew path
eval "$(/opt/homebrew/bin/brew shellenv)"


# Load the shell dotfiles, and then some:
for file in ~/.{aliases,aliases.local,aliases.private,bash_profile.local,bash_profile.host,bash_prompt,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export TERM_PROGRAM=iTerm.app

# Coloured man pages
export PAGER=most

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Share history in tmux sessions
shopt -s histreedit;
shopt -s histverify;
HISTCONTROL="ignoreboth"
PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND";

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
LOCAL_BIN='/opt/homebrew/bin'

# Bash completion v1
# if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
#     source "$(brew --prefix)/etc/bash_completion";
# elif [ -f /etc/bash_completion ]; then
#     source /etc/bash_completion;
# fi;

# Bash completion v2
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Enable tab completion for `g` by marking it as an alias for `git`
# if type __git &> /dev/null && [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
if type __git &> /dev/null && [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;

    # Add git completion to aliases
    __git_complete g __git_main
    __git_complete gb _git_branch
    __git_complete gc _git_commit
    __git_complete gd _git_diff
    __git_complete gl _git_log
    __git_complete gs _git_status
    __git_complete gp _git_push
    __git_complete gpo _git_checkout
    __git_complete gpup _git_checkout
    __git_complete gco _git_checkout
    __git_complete gcl _git_clone
    __git_complete grs _git_reset
    __git_complete grb _git_rebase
    __git_complete gsa _git_stash
    __git_complete gsh _git_show
    __git_complete gpl _git_pull
    __git_complete grm _git_remote
    __git_complete gtag _git_tag
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal TweetDeck" killall;

# Docker alias auto complete
[ -e "$LOCAL_BIN/docker" ] && complete -F _docker d
[ -e "$LOCAL_BIN/docker-machine" ] && complete -F _docker_machine dm
[ -e "$LOCAL_BIN/docker-compose" ] && complete -F _docker_compose dk
#
# # Kubernetes
[ -e "$LOCAL_BIN/kubectl" ] && complete -F __start_kubectl k
[ -e "$LOCAL_BIN/minikube" ] && complete -F __start_minikube m
[ -e "$LOCAL_BIN/kops" ] && complete -o nospace -F __start_kops ko # Doesn't work

# Editor
export EDITOR='vim'

# LS Colors
export CLICOLOR=1

# Cheat Colors
export CHEATCOLORS=true

# Git
export GIT_SSL_NO_VERIFY=true

# Markdown viewer theme
export MDV_THEME=884.0134

# Github support
eval "$(hub alias -s)"

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# Disable control flow shortcuts (C-s and C-q), so they can be used in vim
stty -ixon -ixoff

# Alt-h used by slate to switch focus, adding additional shortcut
bind '"\ex": backward-delete-char'
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# To prevent unable to get local issuer certificate error
export NODE_TLS_REJECT_UNAUTHORIZED=0

# Default 9546 conflict with existing service
export HEALTH_PORT=9547

# Suppress shell deprecation warning in Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
