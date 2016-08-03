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
