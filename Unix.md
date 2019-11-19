# [~/.bash_aliases](https://github.com/iandmyhand/boilerplates/blob/master/UNIX/.bash_aliases)

### Appendix
    - bashrc system default settings location: /etc/bash.bashrc


# [~/.vimrc](https://github.com/iandmyhand/boilerplates/blob/master/UNIX/.vimrc)
  
### Appendix
- vimrc system default setting
       
   ```
   $ sudo vi /etc/vim/vimrc.local
   ```

- Set tail text colours up.

    ```
    #!/bin/zsh
    coloredoutput() {
      tail -f $1 |
      sed -e 's/\(.*\[INFO.*\)/\o033[34m\1\o033[39m/' \
          -e 's/\(.*\[WARN.*\)/\o033[33m\1\o033[39m/' \
          -e 's/\(.*\[ERROR.*\)/\o033[31m\1\o033[39m/'
    }
    alias tailf=coloredoutput
    ```


# [~/.inputrc](https://github.com/iandmyhand/boilerplates/blob/master/UNIX/.inputrc)
    - for Korean Language


  

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

