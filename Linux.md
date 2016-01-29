# ~/.bashrc
```
# 삭제, 복사, 이동시 같은 파일이 있을 경우 사용자에게 확인을 받음
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# 파일 목록을 보여주는 ls 명령어 실행시, 디렉토리를 한글명으로 표시하고 색상을 보여줌.
alias ls='ls -vGF'

# 위의 옵션 + 파일에 대한 모든 정보 함께 출력
alias ll='ls -alvhGF'
```

### Appendix
  - bashrc system 기본 설정을 바꾸려면? 
    ```$ sudo vi /etc/bash.bashrc```


# ~/.vimrc
```
set enc=UTF-8
set fileencodings=UTF-8
set nocompatible
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
set smartindent
set history=15
set ruler
set showcmd
set background=dark
set paste
set nu
set ai
```
  
### Appendix
  - vimrc system 기본 설정을 바꾸려면?
    ```$ sudo vi /etc/vim/vimrc.local```


# ~/.inputrc
```
# 프롬프트 상태에서 한글이 올바르게 입력되도록 함.
set convert-meta off
set meta-flag on
set output-meta on
```
  

# ANSI Color Setting
```
BLACK=35,35,35
RED=230,25,85
GREEN=130,225,25
YELLOW=240,210,20
BLUE=40,100,200
MAGENTA=190,35,120
CYAN=40,200,165
WHITE=240,240,240

BRIGHT_BLACK=50,50,50
BRIGHT_RED=255,85,85
BRIGHT_GREEN=195,235,80
BRIGHT_YELLOW=230,230,110
BRIGHT_BLUE=85,130,220
BRIGHT_MAGENTA=220,90,140
BRIGHT_CYAN=150,225,210
BRIGHT_WHITE=250,250,250
```

