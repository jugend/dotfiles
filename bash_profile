# Load the shell dotfiles, and then some:
for file in ~/.{aliases,aliases.local,bash_profile.local,bash_prompt,functions}; do
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

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal TweetDeck" killall;

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
