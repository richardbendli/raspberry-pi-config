#---------------------------------------------------------------
#██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#██████╔╝███████║███████╗███████║██████╔╝██║
#██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
#██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#---------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '

### EXPORT
# export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\">

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

#HISTORY
#add date and time to history
export HISTTIMEFORMAT="%h %d %H:%M:%S "
#increase bash history size
export HISTSIZE=10000
#increase number of lines contained in history files
export HISTFILESIZE=10000

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control


#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#set a different editor
export EDITOR=nvim
export VISUAL=nvim


# Check that we are root!
if [[ ! $(whoami) =~ "root" ]]; then
echo ""
echo "**********************************"
echo "*** This needs to run as root! ***"
echo "**********************************"
echo ""
exit
fi



#---------------------------------------------------------------
### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


#---------------------------------------------------------------
# print pihole status directly from pihole CLI
echo -e "\n${BLUE_solid}Pihole${NC}"
pihole status


# Print free & used RAM
echo -e "\n${BLUE_solid}RAM${NC}"
echo -e "Free=${GREEN}$freeRAM MB${NC} ; Used=${RED}$usedRAM MB${NC}; Cache=${CYAN}$cacheRAM MB${NC}"


# Potential alternatives
# temp=$(/opt/vc/bin/vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
# freq=$(/opt/vc/bin/vcgencmd measure_clock arm | cut -d'=' -f 2) # in MHz
# freq=$((freq/1000000))


#---------------------------------------------------------------
# █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#███████║██║     ██║███████║███████╗█████╗  ███████╗
#██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#---------------------------------------------------------------

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi


#---------------------------------------------------------------
# update
alias update='sudo apt update && sudo apt upgrade'


#---------------------------------------------------------------
# off and reboot
alias shut="shutdown now"
alias reb="reboot"

# safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'


#---------------------------------------------------------------
# temperature
alias temp='/usr/bin/vcgencmd measure_temp'


#---------------------------------------------------------------
# root privileges
# alias doas="doas --"


#---------------------------------------------------------------
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


#---------------------------------------------------------------
# text editors
# nano
alias nano='sudo nano -l'
# vim
alias vim="nvim"
#alias nvimrc='nvim ~/.config/nvim/'


#---------------------------------------------------------------
# speedtest
alias st="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"


#---------------------------------------------------------------
# weather
alias wtr="curl wttr.in"


#---------------------------------------------------------------
# cheat sheet commands
#alias cheatsh="curl https://cheat.sh/"


#---------------------------------------------------------------
# colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


#---------------------------------------------------------------
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'


#---------------------------------------------------------------
# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'


#---------------------------------------------------------------
# chmod commands
#alias mx='chmod a+x'
alias ux='chmod u+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
#alias 777='chmod -R 777'


#---------------------------------------------------------------
# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'


#---------------------------------------------------------------
# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | sort -nr -k 3 | head -5'


#---------------------------------------------------------------
# recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"


#---------------------------------------------------------------
# userlist
alias userlist="cut -d: -f1 /etc/passwd"

#---------------------------------------------------------------
#---------------------------------------------------------------
