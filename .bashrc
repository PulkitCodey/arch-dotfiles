#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias play='ytfzf -t -c yt --thumb-viewer=ueberzug -m'  # Play audio-only by default
alias vplay='ytfzf -t -c yt --thumb-viewer=ueberzug'    # Play video when you want to watch

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
fastfetch

# --- System Maintenance ---
alias update='sudo pacman -Syu'              # Standard update
alias unlock='sudo rm /var/lib/pacman/db.lck' # Fix "database is locked" errors
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)' # Purge orphaned packages
alias purgelogs='sudo journalctl --vacuum-time=3d' # Keep system logs lean

# --- Configuration (The Ricing Shortcuts) ---
alias i3conf='nano ~/.config/i3/config'      # Edit i3 config
alias barconf='nano ~/.config/polybar/config' # Edit Polybar (if using it)
alias fetchconf='nano ~/.config/fastfetch/config.jsonc' # Edit your chalice logo fetch
alias bashconf='nano ~/.bashrc'              # Edit this file
alias reload='source ~/.bashrc'              # Apply changes to this file immediately

# --- Tools & Scripts ---
alias ff='fastfetch'                         # Quick system info
alias bp='btop'                              # Quick system monitor

# --- Timeshift Safeties ---
alias tsls='sudo timeshift --list'
alias tssave='sudo timeshift --create --comments "Manual Save"'
alias tsnuke='sudo timeshift --delete-all'
alias tsrestore='sudo timeshift --restore'

# --- Navigation Shortcuts ---
alias ..='cd ..'             # Go up one directory
alias ...='cd ../..'         # Go up two directories
alias ....='cd ../../..'     # Go up three directories
alias .='cd'                 # Just typing '.' takes you home (or use 'cd ~')
alias ~='cd ~'               # Quick jump to home
alias conf='cd ~/.config'    # Direct jump to your config folder (The "Rice" HQ)


# Custom LS Colors
# di = directory, ex = executable, fi = normal file
export LS_COLORS="di=00;31:ex=01;31:fi=00;37:ln=01;36:*.tar=01;31:*.zip=01;31:*.py=01;31"

# Apply colors to ls aliases
alias ls='ls --color=auto'
alias ll='ls -lv --group-directories-first'
alias l='ls -CF'                             # Short list
alias la='ls -a --color=auto'
alias grep='grep --color=auto'

alias c='clear'
alias clr='clear'

alias install='sudo pacman -S'               # Quick install
alias remove='sudo pacman -Rns'              # Clean removal (includes dependencies)
alias search='pacman -Ss'                    # Search for packages

alias superclean='sudo pacman -Scc && sudo pacman -Rns $(pacman -Qdtq) && sudo rm -rf /var/cache/pacman/pkg/download-*'

alias shut='sudo shutdown now'               # Instant kill
alias reboot='sudo reboot'
alias mirr='sudo reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist' # Fix slow downloads
