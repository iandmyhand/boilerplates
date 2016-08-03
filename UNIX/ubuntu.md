# Setup Ubuntu from scratch

## Update & upgrade apt-get

    ```
    sudo apt-get -y update && sudo apt-get -y upgrade
    ```

## Install favorite packages

    ```
    sudo apt-get -y install vim vim-gtk ssh git git-core zsh openjdk-8-jdk xfsprogs ntfs-3g glusterfs-server samba samba-common-bin smbclient nginx npm
    ```

## Set up ssh to start when after boot.

    ```
	sudo update-rc.d ssh defaults
	```

## Set up zsh
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    
    ```
    $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
    
- settings
    - Refer to [~/.zshrc](https://github.com/iandmyhand/settings/blob/master/MacOSX/.zshrc)
    - Copy [~/.oh-my-zsh/themes/sssum.zsh-theme](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.zsh-theme)

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

