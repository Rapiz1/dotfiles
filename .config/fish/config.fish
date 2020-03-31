# Prompt
set -g theme_nerd_fonts yes
set -g theme_date_format "+%F %T"
set -g fish_prompt_pwd_dir_length 8

set -U FZF_COMPLETE 0
set FZF_DEFAULT_OPTS "--layout=reverse --height=40% -i"

#set -g ENHANCD_DISABLE_DOT 1
set -g ENHANCD_DOT_ARG "..."
set -a PATH $HOME/.local/bin

alias j cd
alias open "kde-open5 2>/dev/null"
alias han="man -H 2>/dev/null"
alias tss="proxychains -q"
alias lsd="ls -ltr"
alias diff="diff --color"
alias sv="sudo -E vim"

export BROWSER="firefox"
export EDITOR="vim"
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
#export PATH="$HOME/.local/bin:$PATH"
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# ics env
#export NEMU_HOME=/home/rapiz/Source/ics2019/nemu
#export AM_HOME=/home/rapiz/Source/ics2019/nexus-am
#export NAVY_HOME=/home/rapiz/Source/ics2019/navy-apps
