
# Personal .zshrc config & options.

# # Possible visual effects, see here -> http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
# # Colors -> https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
PS1='%K{#ffffff} %F{#808080}%1d%f %k '

# HISTSIZE=99999
# HISTFILESIZE=999999
# SAVEHIST=$HISTSIZE
# alias history="history 1"

# # Enable substitution in the prompt.
setopt prompt_subst

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HISTIGNORESPACE
setopt NOTIFY
setopt HIST_IGNORE_ALL_DUPS
set -o vi

HISTFILE=~/.zsh_history # Set the filename to save history to
HISTSIZE=1000000 # Set your history file to be reasonably huge
# HISTTIMEFORMAT="[%F %T %Z]"

# # Append, clear, and read history after each command
# PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Ignore duplicate commands, and commands that start with spaces
# HISTCONTROL='ignoreboth'


alias studio="open -a /Applications/Android\ Studio.app"
alias video_to_gif='function video_to_gif(){ ffmpeg -i $1 -vf fps=30,scale=1080:-1 $2 && gifsicle -O3 $2 -o $2 && say "Video is ready!"};video_to_gif'


adb_go_offline() {
  adb shell svc wifi disable
  adb shell svc data disable
  echo "Done"
}

adb_go_online() {
  adb shell svc wifi enable
  adb shell svc data enable
  echo "Done"
}

adb_screenshot() {
  if [ $# -eq 0 ]
  then
    name="screenshot.png"
  else
    name="$1.png"
  fi
  adb shell screencap -p /sdcard/$name
  adb pull /sdcard/$name
  adb shell rm /sdcard/$name
  curr_dir=pwd
  echo "save to `pwd`/$name"
}

fd() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/.android/avd
export JAVA_HOME=$(/usr/libexec/java_home)

export REACT_EDITOR=nvim
