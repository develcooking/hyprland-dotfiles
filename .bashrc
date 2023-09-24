# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias nv='nvim'
alias vi='nvim'
alias nano='nvim'
alias pm='pulsemixer'
alias revdeppa='paru -Rsn $(paru -Qdtq)'

export TERM="kitty"
export TERMINAL="kitty"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark
