# Add below script to .zshrc

ZSH_THEME="sssum"

export LC_ALL=en_US.UTF-8
export LANG=ko_KR.UTF-8

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alvhGF'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'

coloredoutput() {
  tail -f $1 |
  sed -e 's/\(\[INFO.*\)/\o033[34m\1\o033[39m/' \
      -e 's/\(\[ERROR.*\)/\o033[31m\1\o033[39m/'
}
alias tailf=coloredoutput
