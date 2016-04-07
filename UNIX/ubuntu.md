# Setup Ubuntu from scratch

## Update & upgrade apt-get

    ```
    sudo apt-get -y update && sudo apt-get -y upgrade
    ```

## Install favorite packages

    ```
    sudo apt-get -y install vim ssh git openjdk-8-jdk xfsprogs ntfs-3g glusterfs-server samba samba-common-bin smbclient nginx npm
    ```

## Set up ssh to start when after boot.

    ```
	sudo update-rc.d ssh defaults
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

