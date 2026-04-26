#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pulse='echo "--- RAM ---"; free -h | grep Mem; echo "--- TEMP ---"; sensors | grep Core'
# Gothic Privacy Shield
alias camoff='sudo chmod 000 /dev/video0 && echo "👁️ Camera is now blind."'
alias camon='sudo chmod 660 /dev/video0 && echo "👁️ Camera can now see."'
# --- Nomad Radio Controls ---
# Wi-Fi
alias wifion='sudo rfkill unblock wifi'
alias wifioff='sudo rfkill block wifi'
alias wifilist='nmcli device wifi list'

# Bluetooth
alias bton='sudo rfkill unblock bluetooth'
alias btoff='sudo rfkill block bluetooth'

# Total Stealth Mode (Kill everything)
alias ghoston='sudo rfkill block all'
alias ghostoff='sudo rfkill unblock all'

# Status Check
alias radiostatus='rfkill list'

alias play='ytfzf -m -t'  # Play audio-only by default
alias vplay='ytfzf -t'    # Play video when you want to watch

NEON='\[\e[38;5;196m\]'
WINE='\[\e[38;5;88m\]'
RESET='\[\e[0m\]'

export PS1="${NEON}†${RESET}\u${NEON}†${RESET} at ${WINE}\h${RESET} in \W > "
# Modern Gothic Intelligence Layer
eval "$(thefuck --alias)"

export PATH="$PATH:$HOME/bin"

eval "$(zoxide init bash)"
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export GEMINI_API_KEY="AIzaSyDaHDPSfbfJps2yuNGIJGswaPfiS0TinUQ"
export GEMINI_API_KEY="AIzaSyDnarUHvEQKTGeHzIJzwztLTrovMp6lPPE"
