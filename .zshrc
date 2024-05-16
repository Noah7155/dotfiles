# --------------------------------------------------------------------------------
#
#  ____                               __ _                     _____ _ ____ ____
# |  _ \ _ __ __ _  __ _  ___  _ __  / _| | __ _ _ __ ___   __|___  / | ___| ___|
# | | | | '__/ _` |/ _` |/ _ \| '_ \| |_| |/ _` | '_ ` _ \ / _ \ / /| |___ \___ \
# | |_| | | | (_| | (_| | (_) | | | |  _| | (_| | | | | | |  __// / | |___) |__) |
# |____/|_|  \__,_|\__, |\___/|_| |_|_| |_|\__,_|_| |_| |_|\___/_/  |_|____/____/
#                  |___/
#
# --------------------------------------------------------------------------------
#
# https://www.youtube.com/channel/UCqGyzqfltwGBneZOUEz7ayg
#
# --------------------------------------------------------------------------------
#
# https://github.com/Dragonflame7155
#
# --------------------------------------------------------------------------------

() {
  emulate -L zsh

  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Determine terminal capabilities.
  {
    if ! zmodload zsh/langinfo zsh/terminfo ||
       [[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] ||
       (( terminfo[colors] < 256 )); then
      local USE_POWERLINE=false
      # Define alias `x` if our parent process is `login`.
      local parent
      if { parent=$(</proc/$PPID/comm) } && [[ ${parent:t} == login ]]; then
        alias x='startx ~/.xinitrc'
      fi
    fi
  } 2>/dev/null

  if [[ $USE_POWERLINE == false ]]; then
    # Use 8 colors and ASCII.
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
  else
    # Use 256 colors and UNICODE.
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
  fi
}

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one setopt autocd
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R


# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Offer to install missing package if command is not found
if [[ -r /usr/share/zsh/functions/command-not-found.zsh ]]; then
    source /usr/share/zsh/functions/command-not-found.zsh
    export PKGFILE_PROMPT_INSTALL_MISSING=1
fi

# Set terminal window and tab/icon title
#
# usage: title short_tab_title [long_window_title]
#
# See: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully supports screen and probably most modern xterm and rxvt
# (In screen, only short_tab_title is used)
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a" # set window name
      print -Pn "\e]1;${1:q}\a" # set tab name
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\" # set screen hardstatus
      ;;
    *)
    # Try to use terminfo to set the title
    # If the feature is available set title
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"

# Runs before showing the prompt
function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# Runs before executing the command
function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  # split command into array of arguments
  local -a cmdargs
  cmdargs=("${(z)2}")
  # if running fg, extract the command from the job description
  if [[ "${cmdargs[1]}" = fg ]]; then
    # get the job id from the first argument passed to the fg command
    local job_id jobspec="${cmdargs[2]#%}"
    # logic based on jobs arguments:
    # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
    # https://www.zsh.org/mla/users/2007/msg00704.html
    case "$jobspec" in
      <->) # %number argument:
        # use the same <number> passed as an argument
        job_id=${jobspec} ;;
      ""|%|+) # empty, %% or %+ argument:
        # use the current job, which appears with a + in $jobstates:
        # suspended:+:5071=suspended (tty output)
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -) # %- argument:
        # use the previous job, which appears with a - in $jobstates:
        # suspended:-:6493=suspended (signal)
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*) # %?string argument:
        # use $jobtexts to match for a job whose command *contains* <string>
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *) # %string argument:
        # use $jobtexts to match for a job whose command *starts with* <string>
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac

    # override preexec function arguments with job command
    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec

# File and Dir colors for ls and other outputs
eval "$(dircolors -b)"

source ~/.git-prompt.sh
source ~/.github_stuff.sh

#COLOR1='052'
#SEPERATOR='059'
#TIP_COLOR='000'

#setopt PROMPT_SUBST ; #PS1='[%n@%m %c$(__git_ps1 "(%s)")]\$'
#PS1='[%F{red}%n%f]-[%F{red}%m%f]-[%F{red}%~%f%s ]-[%F{red}%t%f]-[%F{red}%H%D%Y%f]-[%F{cyan}%x%f]-[%F{red}%h%f]
#→ '
PS1=' %F{cyan}%~%f > '
#PS1='%F{$COLOR1}%f%K{$COLOR1}%n@%m %k%F{$COLOR1}%K{$SEPERATOR}%f %F{$SEPERATOR}%k%K{$TIP_COLOR}%f%F{$COLOR1} %~ %f%k%F{$TIP_COLOR}%f'
#RPS1='%F{$TIP_COLOR}%f%K{$TIP_COLOR} %F{$COLOR1}%(?.✓.[%?] ) %F{$SEPERATOR}%k%k%f%K{$SEPERATOR} $(__git_ps1 " %s ")%F{$COLOR1}%K{$SEPERATOR}%k%f%K{$COLOR1}%T %H%D%Y%k%F{$COLOR1}%f'
#PS2='%F{$COLOR1}%f%K{$COLOR1}%_%k%K{$SEPERATOR}%F{$COLOR1}%f%k%K{$TIP_COLOR}%F{$SEPERATOR}%f%k%F{$TIP_COLOR}%f'
alias dragonflame="ascii-image-converter Pictures/star.png -W 50 --braille --dither"
alias backup='~/code/backup.sh'
alias tetris='v run ~/v/examples/tetris/tetris.v '
alias 2048='v run ~/v/examples/2048/2048.v'
alias vcasino='v run ~/v/examples/vcasino/vcasino.v '
alias fireworks='v run ~/v/examples/fireworks/fireworks.v'
alias figlet='figlet -t'
alias :q="exit"
alias ls="exa --icons --group-directories-first"
alias freecache='sudo sh -c "echo 1 >  /proc/sys/vm/drop_caches"'
alias simplebackup='~/programs/simplebackup.sh'
# alias ls='/opt/coreutils/bin/ls --color=force'

source ~/.local/share/icons-in-terminal/icons_bash.sh

function dffile {
  cat ~/.banner.txt >> $1
}

function dffile_fancy {
  cat ~/.banner_fancy.txt >> $1
}

function imagecat {
  kitty +kitten icat $1
}
#neofetch --ascii "$(ascii-image-converter ~/.png -W 50 --braille --dither)" | lolcat
#afetch | lolcat
#figlet Dragonflame7155 | lolcat
afetch
export BROWSER=librewolf
alias communism="~/rust/communist/target/debug/communist "
alias aafire="aafire -driver curses"
alias lvim="/home/noah/.local/bin/lvim"

