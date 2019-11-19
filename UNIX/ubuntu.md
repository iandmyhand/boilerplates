# Setup Ubuntu from scratch

## Setup timezone

    ```
    $ sudo timedatectl set-timezone Asia/Seoul
    ```

## Update & upgrade apt-get

    ```
    sudo apt-get -y update && sudo apt-get -y upgrade
    ```

## Install favorite packages

    ```
    sudo apt-get -y install vim vim-gtk curl ssh git git-core zsh openjdk-8-jdk npm python3 python3-pip direnv figlet lolcat
    sudo apt-get -y xfsprogs ntfs-3g glusterfs-server samba samba-common-bin smbclient nginx
    sudo apt-get -y figlet lolcat
    ```

## Set up ssh to start automatically after boot.

    ```
    sudo update-rc.d ssh defaults
    ```

## Set up login message.
   
   ```
   $ sudo vi /etc/update-motd.d/50-ip-address
   #!/bin/sh
   IP=$(ifconfig | grep "inet addr")
   printf "\nIP of this machine: \n%s\n" "$IP"
   ```

## Set up zsh
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

    ```
    $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

- settings
    - Refer to [~/.zshrc](https://github.com/iandmyhand/settings/blob/master/MacOSX/.zshrc)
    - Copy [~/.oh-my-zsh/themes/sssum.zsh-theme](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.zsh-theme)
    
### Use IP for Ubuntu terminal prompt on EC2

     ```
    $ vi ~/.oh-my-zsh/themes/sssum.zsh-theme
    PRIVATE_IP="$(curl http://169.254.169.254/latest/meta-data/local-ipv4 2>/dev/null)"
    IP_LAST_HALF="$(echo $PRIVATE_IP | cut -d'.' -f 3,4)"
    PROMPT='$IP_LAST_HALF$INDICATOR_COLOR» $BLUE%2d$(git_prompt_info)$(git_prompt_status)$RESET '
    ```

### Use IP as Ubuntu ssh welcome message on EC2

    ```
    $ vi ~/.zshrc
    PRIVATE_IP="$(curl http://169.254.169.254/latest/meta-data/local-ipv4 2>/dev/null)"
    IP_LAST_HALF="$(echo $PRIVATE_IP | cut -d'.' -f 3,4)"
    figlet "WELCOME TO $IP_LAST_HALF" | lolcat
    ```

### Setup direnv

    ```
    $ vi ~/.zshrc
    eval "$(direnv hook zsh)"
    ```

### Brief system status when connected

- Copy [sys_briefing.sh](https://github.com/iandmyhand/boilerplates/blob/master/UNIX/sys_briefing.sh) to proper location and add an executable authority to it.

    ```
    $ chmod 764 sys_briefing.sh
    $ vi ~/.zshrc
    [YOUR_PROPER_LOCATION]/sys_briefing.sh
    ```
    
## Set up skel

    ```
    $ echo $SHELL
    /usr/bin/zsh
    $ sudo vi /etc/adduser.conf
    # change DSHELL to $SHELL
    $ sudo cp ~/.zshrc /etc/skel/
    $ sudo cp ~/.inputrc /etc/skel/
    $ sudo cp ~/.vimrc /etc/skel/
    $ sudo cp -R ~/.oh-my-zsh /etc/skel/
    ```

## Block wifi by default

    ```
    sudo vi /etc/rc.local
    ```

    ```
    ...
    rfkill block wifi
    ...
    exit 0
    ```

## for vim
- Shortcut for mouse (.vimrc)

    ```map <F2> :set mouse=a<CR>``` Enable mouse by F2 key

    ```map <F3> :set mouse=c<CR>``` Disable mouse by F3 key

- Yanked and deleted lines go into local clipboard

    ```set clipboard=unnamedplus```

    - need to be enabled ```+clipboard``` for vim (To make clipboard enable, install vim-gtk)
 
        ```
        $ vim --version
        ...
        +clipboard
        ...
        ```
