# Set up Raspberry Pi 2 B & B+ (On Mac OS X)

## References
- [라즈베리파이 활용법 주요 포스트 Rasplay & OpenMake](http://wiki.rasplay.org/doku.php)

## Raspbian 설치 및 부팅
- 참고
    - B+ 모델까지는 Ubuntu가 공식지원하지 않기 때문에 다른 버전을 설치하거나 Raspbian을 설치해야 한다.
    - 2B 모델부터는 Snappy Ubuntu Core를 설치할 수 있지만, Snappy는 apt-get이 지원되지도 않고 아직 레퍼런스가 별로 없으니 그냥 Debian 기반인 Raspbian을 설치하자.
- Raspbian 설치(Max OS X 기준. Windows나 Linux를 사용한다면 [이 곳](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)에 가이드가 있다.)
    - [Raspbian download](https://www.raspberrypi.org/downloads/raspbian/) 페이지에서 OS 이미지 파일을 다운받는다. (terminal로만 작업할 경우 RASPBIAN JESSIE LITE를 받으면 된다.)
    - Disk Utility를 실행 후 좌측 패널에서 자신의 SD card를 선택 후, 상단 *Erase* 버튼을 클릭한다.
    - Name은 적당히 입력하고(어차피 OS image를 설치할 때 알아서 바뀐다.) Format은 *MS-DOS (FAT)*을 선택한다.
    - SD card format 완료 후 terminal에서 다음 명령어로 raspbian을 설치한다.
    - <disk# from diskutil> 에는 ```diskutil list```로 찾은 micro SD card의 번호를 입력하면 되겠다.
    
    ```
    diskutil list
    diskutil unmountDisk /dev/disk<disk# from diskutil>
    sudo dd bs=1m if=image.img of=/dev/rdisk
    sudo dd bs=1m if=2015-11-21-raspbian-jessie-lite.img of=/dev/rdisk<disk# from diskutil>
    diskutil unmountDisk /dev/disk<disk# from diskutil>
    ```

- 부팅/접속 (초기 계정: pi / raspberry)
    - 라즈베리파이에 micro-SD card 넣기
    - 모니터 없이 IP 알아내서 접속하기
        - brew로 Nmap 설치하기 (brew를 사용하지 않는다면 [nmap 공식 홈페이지](https://nmap.org/book/inst-macosx.html)에서 다운받아 설치해도 된다.)
    
        ```
        $ brew install nmap
        ```
    
    - ifconfig에서 broadcast로 나오는 IP를 확인하여 nmap으로 현재 접속한 라우터에 어떤 IP들이 있는지 확인해본다.
    
        ```
        $ ifconfig
        ...
        … broadcast 192.168.10.255
        ...
        $ nmap 192.168.10.1/24
        ...
        Nmap scan report for 192.168.10.105
        ...
        ```
    
    - 위와 같이 스캔한 IP들이 출력된다. 라즈베리파이로 추정되는 IP로 접속해보자.
    
        ```
        $ ssh pi@<IP>
        ```
    
    - 모니터/키보드 연결해서 실행하기
        - LAN 선 꼽고 키보드 연결하고 HDMI 선 모니터에 연결하고 마지막에 전원 연결
        - 부팅이 완료되면 할당된 IP가 중간에 나타나니 적어두었다가 접속
        
        ```
        $ ssh pi@<IP>
        ```


## Initial Setting

### 패스워드 변경
    - 접속이 된다면 일단 기본 패스워드부터 바꿔주자.
    
    ```
    $ passwd
    ```

### micro SD card에서 파티셔닝되지 않은 남은 부분 사용할 수 있도록 세팅하기
    - *fdisk*를 이용하여 파티셔닝을 다시 해준다.
        - *-l* 옵션을 사용하여 우선 기존 내용을 확인 후 작업한다.
        
        ```
        $ sudo fdisk -l
        $ sudo fdisk -u -c /dev/mmcblk0  # u(units): 단위를 출력해준다. c(compatibility): dos/nondos 모드를 선택한다.
        ```
        
        - p 로 영역 알아보기. Linux로 할당되어 있는 파티션을 수정해주어야 함
        - d -> 2 기존에 Linux로 할당되어 있는 파티션 삭제
        - n -> p(primary) -> 2(기존에 할당되어 있던 파티션 번호
        - First sector: p를 입력했을 때 출력된 1번 파티션의 End + 1을 입력한다. e.g. 131071이 End였다면 131072를 입력.
        - Last sector: Default가 max값으로 잡혀있을 것이다. 그냥 Return.
        - w (반영) -> q (종료) (w 입력 시 error가 발생하며 튕길 수도 있다. 파티셔닝은 완료된 상태이니 걱정말자.)
        
        ```
        $ sudo resize2fs /dev/mmcblk0p2
        $ sudo raspi-config
        -> 1 Expand Filesystem (선택하면 rebooting 뒤에 반영된다는 메시지가 뜸)
        OK
        Esc
        ```

### hostname 설정해주기
    - */etc/hostname*과 */etc/hosts* 파일 수정
        - /etc/hostname 파일에서 raspberrypi를 원하는 이름으로 변경해주기
        
        ```
        $ sudo vi /etc/hostname
        ```
        
    - /etc/hosts 파일에서 로컬호스트에 raspberrypi로 매핑되어 있는 부분을 방금 설정한 이름으로 변경해주기
    
        ```
        $ sudo vi /etc/hosts
        ```

### hostname & 파티셔닝 설정 반영
    - 변경설정을 적용하기 위해 재부팅
    
        ```
        $ sudo reboot
        ```
        
    - 재접속하여 hostname 및 파티셔닝이 정상적으로 반영되었는지 확인
    
        ```
        $ hostname
        myhostname
        $ df -h
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/root       7.2G  1.3G  5.7G  18% /
        /dev/sda1      1953480700  416936 1953063764   1% /mnt
        ```

### apt-get 업데이트 및 업그레이드
    - 업그레이드는 시간이 좀 걸린다. 명령어 날려두고 커피 한 잔 하고 오자.
    
        ```
        $ sudo apt-get update && sudo apt-get upgrade -y
        $ sudo apt-get -y install vim xfsprogs git openjdk-8-jdk
        ```
        
    - 혹시 JDK가 설치되지 않으면 아래와 같이 repo 등록 후 다시 설치 시도
    
        ```
        $ sudo add-apt-repository ppa:openjdk-r/ppa
        $ sudo apt-get update
        ```
        
    - vim: remote shell에서 vim의 insert 모드에서 화살표/백스페이스키가 다른 문자로 출력되는 버그가 있는 경우 새로 설치하면 해결됨
    - xfsprogs: HDD나 외장하드를 분산파일시스템으로 묶어 쓰고 싶고, GlusterFS를 쓸거라면 XFS로 포맷해주는 것을 추천.
    - git: 개발할거면… 당연히 필요하다.
    - openjdk-8-jdk: java로 개발하는 경우 필요. (Oracle JDK는 business에서 사용하려면 사용료를 지불해야 하므로 개발 시작부터 OpenJDK를 사용하는 것을 추천)

### 개인환경 설정하기
    - [리눅스 개인환경 설정](https://github.com/iandmyhand/settings/blob/master/Linux.md)을 참고하여 필요한 부분을 설정해준다.
    - 한글 설정
        - raspi-config를 이용해서 언어 설정을 추가한다.
      
        ```
        $ sudo raspi-config
        5 Internationalisation Options        Set up language and regional settings
        I1 Change Locale                      Set up language and regional settings
        ```
        
        - en_GB.UTF-8 UTF-8, en_US.UTF-8 UTF-8, ko_KR.UTF-8 UTF-8 세 개를 스페이스바로 선택 후 엔터. 디폴트는 영어로 해주자.(en_GB)

### 외장하드 마운트
    - NTFS format의 HDD나 외장하드를 연결해서 사용할 생각이라면 NTFS에 읽고 쓰기가 가능한 라이브러리가 필요함. GlusterFS를 쓸거라면 다시 포맷해서 쓰면 되지만, 기존 데이터를 백업해두고 싶다면 설치 후 백업을 하자.
    
        ```
        $ sudo apt-get -y install ntfs-3g
        ```
    - 마운트
        - 현재 라즈베리파이에 연결된 장치를 blkid로 검색해본다. 이거 내 외장하드다 싶은 이름이 보일 것이다.
        
        ```
        $ sudo blkid
        ...
        dev/sda1: LABEL="My Book" UUID="ABCD" TYPE="ntfs" PARTUUID="4abc3210-01"
        ...
        ```
        
        - 외장하드의 boot name을 확인해보자.
        
        ```
        $ sudo fdisk –l
        ...
        Device     Boot Start        End    Sectors  Size Id Type
        /dev/sda1        2048 3906963455 3906961408  1.8T  7 HPFS/NTFS/exFAT
        ...
        ```
        
        - 마운트 포인트 생성 후 해당 포인트에 마운트 해준다.
        
        ```
        $ mkdir -p /mnt/exdrive
        $ sudo mount /dev/sda1 /mnt/exdrive
        ```
        
        - 읽고 쓸 수 있도록 권한을 변경해준다.
        
        ```
        $ sudo chmod 777 /mnt/exdrive
        ```
        
            - ntfs 라이브러리를 설치하지 않고 마운트했다면 권한 수정에 실패한다. 이 경우 ```$ sudo umount /mnt/exdrive```로 언마운트 후 ntfs를 설치하고 다시 해보자.
        - 잘되었는지 테스트해보자.
        
        ```
        $ cd /mnt/exdrive
        $ touch test.txt
        $ echo "TEST" >> test.txt
        $ cat test.txt
        TEST
        ```
        
        - 필요하다면 백업을 해둔다.(용량이 크다면 다른 곳에 백업한다. 8GB짜리 SD카드에 운영체제 설치 등을 했다면 대략 6GB밖에 안남는다.)
    
        ```
        $ cd $HOME
        $ mkdir backups
        $ cd backups
        $ cp /mnt/exdrive/* ./
        ```
    
        - [참고](http://www.modmypi.com/blog/how-to-mount-an-external-hard-drive-on-the-raspberry-pi-raspian)

### 분산파일시스템 GlusterFS 설치
    - 외장하드는 언마운트 후 XFS로 다시 포맷한다.
        - 기존 마운트를 해제한다.
        
        ```
        $ sudo umount /mnt/exdrive
        ```
        
        - 파티셔닝을 하나로 합친다.
        
        ```
        $ sudo fdisk -u -c /dev/sda1  # u(units): 단위를 출력해준다. c(compatibility): dos/nondos 모드를 선택한다.
        ```
        
        - p 로 영역 알아보기. Linux로 할당되어 있는 파티션을 수정해주어야 함
        - d -> <숫자> 기존 파티션을 모두 삭제한다.
        - n -> p(primary) -> 1
        - First sector: Return(default)
        - Last Sector: Return(default)
        - w (반영) -> q (종료)
        - mkfs.xfs를 이용하여 xfs로 다시 포맷한다.(-f(force): 강제 포맷(기존 내용 삭제). -L(Label): 디스크에 이름 붙여주기)
        
        ```
        $ sudo mkfs.xfs -f -i size=512 -n size=8192 -L "My Book" /dev/sda1
        ```
        
        - 기존에 만들어둔 마운트 포인트에 마운트 해보고 *df*를 이용해 정상적으로 되었는지 확인해본다.
        
        ```
        $ sudo mount -t xfs /dev/sda1 /mnt/exdrive
        $ sudo chmod 777 /mnt/exdrive
        $ df -h
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sda1       1.9T   33M  1.9T   1% /mnt/exdrive
        ```
        
        - 파일이 정상적으로 작성되는지 테스트해본다.
        
        ```
        $ mkdir -p /mnt/exdrive/tmp1/tmp2
        $ echo "TEST" >> /mnt/exdrive/tmp1/tmp2/test.txt
        $ cat /mnt/exdrive/tmp1/tmp2/test.txt
        TEST
        $ rm -r /mnt/exdrive/tmp1/
        ```
        
        - 시스템 재시작 후에도 자동으로 마운트되도록 *fstab*의 마지막 줄에 마운트 내용을 추가해준다.
        
        ```
        $ sudo vi /etc/fstab
        ...
        /dev/sda1 /mnt/exdrive xfs defaults 0 0
        ```
        
    - GlusterFS 설치 (apt-cache search glusterfs 날려보면 이미 repo에 다 있다.)
        ```
        $ sudo apt-get install -y glusterfs-server
        $ sudo chmod -R 777 /var/log/glusterfs/
        $ mkdir -p /mnt/exdrive/brick
        ```

#### GlusterFS Cluster Mode
    - 각 서버에서 다른 서버를 등록한다.
    
        ```
        $ sudo gluster peer probe <HOST NAME>
        peer probe: success.
        ```
        
    - 모든 서버에서 gluster peer probe 등록을 했으면, 상태를 체크해본다.
    
        ```
        $ sudo gluster peer status
        Number of Peers: 1
    
        Hostname: raspberry
        Uuid: 0391c68b-a3ed-4e77-b3d1-a2f9e7a9d8c2
        State: Peer in Cluster (Connected)
        ```
        
        ```
        $ sudo gluster volume create glusv0 replica 2 transport tcp rasp01:/mnt/exdrive/brick rasp02:/mnt/exdrive/brick
        ```

#### GlusterFS Stand Alone Mode
    - Gluster volume을 생성한다.
    
    ```
    $ sudo gluster volume create glusv0 transport tcp rasp01:/mnt/exdrive/brick
    volume create: glusv0: success: please start the volume to access data
    $ sudo gluster volume start glusv0
    volume start: glusv0: success
    $ sudo gluster volume info
  
    Volume Name: glusv0
    Type: Distribute
    Volume ID: 003a5e43-0373-462e-af04-bf1ce55ff776
    Status: Started
    Number of Bricks: 1
    Transport-type: tcp
    Bricks:
    Brick1: rasp01:/mnt/exdrive/brick
    $ sudo vi /etc/fstab
    ...
    <HOST NAME>:/glusv0  /home/pi/gluster  glusterfs defaults,_netdev  0       0
    $ mkdir $HOME/gluster
    $ sudo mount.glusterfs <HOST NAME>:/glusv0 $HOME/gluster
    $ sudo mount
    $ sudo chmod 777 $HOME/gluster/
    ```
    
    - Test
    
    ```
    $ touch $HOME/gluster/test.txt
    $ echo "TEST" >> $HOME/gluster/test.txt
    $ ls /mnt/exdrive/brick
    total 4.0K
    drwxr-xr-x 3 pi   38 Jan 28 16:18 ./
    drwxrwxrwx 3 root 18 Jan 28 09:41 ../
    drw------- 7 root 70 Jan 28 16:18 .glusterfs/
    -rw-r--r-- 2 pi    5 Jan 28 16:19 test.txt
    $ cat /mnt/exdrive/brick/test.txt
    TEST
    $ sudo reboot
    $ cat $HOME/gluster/test.txt
    TEST
    ```

#### References
    - [xfs 포맷하기](https://linhost.info/2012/08/format-a-volume-as-xfs-in-debian-and-ubuntu/)
    - [GlusterFS 홈페이지](https://www.gluster.org/)
    - [GlusterFS 설치하기](http://banoffeepiserver.com/glusterfs/set-up-glusterfs-on-two-nodes.html): 설치 부분만 참고.
    - [GlusterFS 세팅하기](http://gluster.readthedocs.org/en/latest/Install-Guide/Common_criteria/#getting-started)

### samba
    - samba는 Windows에 연결하기 위해 필요
        - samba 설치
        
        ```
        $ sudo apt-get install -y samba samba-common-bin smbclient
        $ sudo chmod -R 777 /var/log/samba/
        ```
        
        - samba 계정이름은 linux 계정이름과 동일해야함. 
        - 신규유저 추가하기 전에 skel을 설정해두었던 스크립트로 변경해주기
        
        ```
        $ sudo cp $HOME/.bashrc /etc/skel/
        $ sudo cp $HOME/.vimrc /etc/skel/
        $ sudo cp $HOME/.inputrc /etc/skel/
        ```
        
        - 삼바용 Linux 계정 추가
        
        ```
        $ sudo adduser --group samba
        Adding group `samba' (GID 1002) ...
        Done.
        $ sudo adduser --home /home/test --gid 1002 test
        Adding user `test' ...
        Adding new user `test' (1001) with group `samba' ...
        Creating home directory `/home/test' ...
        Copying files from `/etc/skel' ...
        Enter new UNIX password:
        Retype new UNIX password:
        passwd: password updated successfully
        Changing the user information for samba
        Enter the new value, or press ENTER for the default
          Full Name []: <이름 입력>
          Room Number []: <아무거나 입력>
          Work Phone []: <아무거나 입력>
          Home Phone []: <아무거나 입력>
          Other []: <아무거나 입력>
        Is the information correct? [Y/n] Y
        $ sudo mkdir /home/test/gluster
        $ mkdir $HOME/gluster/test
        $ sudo chown test:samba $HOME/gluster/test
        $ sudo mount.glusterfs <HOST NAME>:/glusv0 /home/test/gluster
        $ sudo mount
        ```
        
        - samba 계정 추가(방금 추가한 linux 계정명으로 입력한다.)
        
        ```
        $ sudo smbpasswd -a test
        New SMB password:
        Retype new SMB password:
        Added user test.
        ```
        
        - samba 환경 설정 (smb.conf 가장 하단에 추가)
        
        ```
        $ sudo vi /etc/samba/smb.conf
        [test]
        comment = Raspberry Pi Samba Server
        path = /home/test/gluster/test
        writable = yes
        browseable = yes
        valid users = chochocho
        create mask = 0775
        directory mask = 0775
        ```
        
            - path가 로그인 시 home 폴더로 보임
            
        - 환경 설정 정상적으로 적용되었는지 확인
        
        ```
        $ testparm
        Load smb config files from /etc/samba/smb.conf
        Processing section "[homes]"
        Processing section "[printers]"
        Processing section "[print$]"
        Processing section "[test]"
        Loaded services file OK.
        Server role: ROLE_STANDALONE
        Press enter to see a dump of your service definitions
        ```
        
        - 계정 활성화
        
        ```
        $ sudo smbpasswd -e test
        Enabled user test.
        ```
        
        - 계정 리스트
        
        ```
        sudo pdbedit -L
        test:4294967295:Samba
        ```
        
        - 실행
        
        ```
        $ sudo smbd start
        $ sudo nmbd start
        ```
        
        - Test
        
        ```
        $ smbclient -L localhost -U test
        Enter test's password:
        Domain=[WORKGROUP] OS=[Unix] Server=[Samba 4.1.17-Debian]
    
          Sharename       Type      Comment
          ---------       ----      -------
          test            Disk      Raspberry Pi Samba Server
          print$          Disk      Printer Drivers
          IPC$            IPC       IPC Service (Samba 4.1.17-Debian)
        Domain=[WORKGROUP] OS=[Unix] Server=[Samba 4.1.17-Debian]
    
          Server               Comment
          ---------            -------
          HOST NAME            Samba 4.1.17-Debian
    
          Workgroup            Master
          ---------            -------
          WORKGROUP            HOST NAME
        ```
        
    - References
        - [Exporting Gluster volumes through samba](http://www.gluster.org/community/documentation/index.php/Gluster_3.2:_Exporting_Gluster_Volumes_Through_Samba)
        - [Setting up a SAMBA Server on Raspberry Pi](http://theurbanpenguin.com/wp/index.php/setting-up-a-samba-server-on-raspberry-pi/)
        - http://superuser.com/questions/347492/how-do-i-connect-to-an-smb-share
        - [맥에서 접속하기](https://support.apple.com/en-us/HT204445)

### DDNS 설정 (DNSEver 이용하는 경우)
    - DDNS에 IP 보고해줄 스크립트 생성
    
        ```
        $ sudo vi /usr/local/bin/ddns.sh
        #!/bin/sh
        /usr/bin/wget -O - --http-user=<USER NAME> --http-passwd=<PASSWORD> 'http://dyna.dnsever.com/update.php?host[<HOST NAME>]'
        ```
        
    - 실행권한 부여
    
        ```
        $ sudo chmod +x /usr/local/bin/ddns.sh
        $ sudo vi /etc/crontab
        ```
        
    - 아래와 같이 스트립트를 crontab에 추가
    
        ```
        */5 * * * * root /usr/local/bin/ddns.sh > /dev/null 2>&1
        ```
        
    - 접속 때마다 한 번씩 실행해주도록 추가
    
        ```
        $ sudo vi /etc/rc.local
        /usr/local/bin/ddns.sh
        ```

### Node 설치
  - Verify node isn't installed yet. It should print 'command not found'.
    ```$ node --version```
  - Set up the apt-get repo source
    ```$ curl -sL https://deb.nodesource.com/setup | sudo bash -```
  - Install Node itself
    ```$ sudo apt-get install nodejs```
  - I then had to log out and log back in to get the path right.
    ```
    $ node --version // should print version 0.10.38 or similar
    $ npm --version // should print 1.4.28 or similar
    $ sudo node --version // should work as well
    $ sudo npm install -g express-generator pm2
    ```
  - node source directory로 이동
  - pm2로 node 관리 (명령어는 찾아보자)
    ```
    $ pm2 start server.js
    ```

### git automating deployment
  https://developer.github.com/guides/automating-deployments-to-integrators/

### Nginx 설치
  ```
  $ sudo apt-get -y install curl build-essential libpcre3-dev libpcre++-dev zlib1g-dev libcurl4-openssl-dev libssl-dev
  $ NGINX_VERSION=1.8.0
  $ mkdir -p $HOME/apps/nginx-$NGINX_VERSION $HOME/logs/nginx $HOME/www
  $ wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
  $ tar xf nginx-$NGINX_VERSION.tar.gz
  $ cd nginx-$NGINX_VERSION/
  $ . configure \
  > --prefix=$HOME/apps/nginx-$NGINX_VERSION \
  > --error-log-path=$HOME/logs/nginx/error.log \
  > --http-log-path=$HOME/logs/nginx/access.log \
  > --with-http_ssl_module
  $ make && make install
  $ ln -s $HOME/apps/nginx-$NGINX_VERSION $HOME/apps/nginx
  $ vi $HOME/apps/nginx/conf/nginx.conf
  server {
           listen       <PORT>;
           server_name  <HOST NAME>;
           location / {
               proxy_pass http://localhost:<PORT>;
               proxy_http_version 1.1;
               proxy_set_header Upgrade $http_upgrade;
               proxy_set_header Connection 'upgrade';
               proxy_set_header Host $host;
               proxy_cache_bypass $http_upgrade;
           }
  }
  ```
