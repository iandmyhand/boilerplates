# Add below script to .zshrc
...
export ZSH="$HOME/.oh-my-zsh"
...
ZSH_THEME="sssum"
...
export LC_ALL=en_US.UTF-8
export LANG=ko_KR.UTF-8
...
# Uncomment below lines.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
...
eval "$(ssh-agent -s)"
ssh-add -k ~/.ssh/id_rsa
...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alvhGF'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias gfff='git flow feature finish'
alias gfrs='git flow release start'
alias gfrp='git flow release publish'
alias gfrf='git flow release finish'
alias gfrff='git checkout develop && git pull && git push && git push --tags && git checkout master && git pull && git push && git checkout develop'
alias gfhs='git flow hotfix start'
alias gfhp='git flow hotfix publish'
alias gfhf='git flow hotfix finish'

coloredoutput() {
  tail -f $1 |
  sed -e 's/\(\[INFO.*\)/\o033[34m\1\o033[39m/' \
      -e 's/\(\[ERROR.*\)/\o033[31m\1\o033[39m/'
}
alias tailf=coloredoutput

figlet Welcome! | lolcat
