# Add below script to .zshrc

ZSH_THEME="sssum"

export LC_ALL=en_US.UTF-8
export LANG=ko_KR.UTF-8

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alvhGF'
alias gffs='git flow feature start'
120 alias gfff='git flow feature finish'
alias gfrs='git flow release start'
alias gfrp='git flow release publish'
alias gfrf='git flow release finish'
alias gfrff='git push && git push --tags && git checkout master && git push && git checkout develop'
alias gfhs='git flow hotfix start'
alias gfhs='git flow hotfix publish'
alias gfhf='git flow hotfix finish'

coloredoutput() {
  tail -f $1 |
  sed -e 's/\(\[INFO.*\)/\o033[34m\1\o033[39m/' \
      -e 's/\(\[ERROR.*\)/\o033[31m\1\o033[39m/'
}
alias tailf=coloredoutput
