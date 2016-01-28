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

### apt-get 업데이트 및 업그레이드 (업그레이드는 시간이 좀 걸림)
  ```
  $ sudo apt-get update
  $ sudo apt-get upgrade
  $ sudo apt-get -y install vim ntfs-3g git openjdk-8-jdk
  ```
  - 혹시 JDK가 설치되지 않으면 아래와 같이 repo 등록 후 다시 설치 시도
  ```
  sudo add-apt-repository ppa:openjdk-r/ppa
  sudo apt-get update
  ```
  - vim: remote shell에서 vim의 insert 모드에서 화살표/백스페이스키가 다른 문자로 출력되는 버그가 있는 경우 새로 설치하면 해결됨
  - ntfs-3g: NTFS format의 HDD나 외장하드를 연결해서 사용할 생각이라면 NTFS에 읽고 쓰기가 가능한 라이브러리가 필요함
  - git: 개발할거면… 당연히 필요하다.
  - openjdk-8-jdk: java로 개발하는 경우 필요. (Oracle JDK는 business에서 사용하려면 사용료를 지불해야 하므로 개발 시작부터 OpenJDK를 사용하는 것을 추천)

### 개인환경 설정하기
  - [리눅스 개인환경 설정]() 참고
  - 한글 설정
    - raspi-config를 이용해서 언어 설정을 추가한다.
    ```
    $ sudo raspi-config
    5 Internationalisation Options        Set up language and regional settings
    I1 Change Locale                      Set up language and regional settings
    ```
    - en_GB.UTF-8 UTF-8, en_US.UTF-8 UTF-8, ko_KR.UTF-8 UTF-8 세 개를 스페이스바로 선택 후 엔터. 디폴트는 영어로 해주자.(en_GB)

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

### micro SD card에서 파티셔닝되지 않은 남은 부분 사용할 수 있도록 세팅하기
  ```
  $ sudo fdisk -l
  $ sudo fdisk -u -c /dev/mmcblk0
  ```
  - p 로 영역 알아보기. Linux로 할당되어 있는 파티션을 수정해주어야 함
  - d -> 2 기존에 Linux로 할당되어 있는 파티션 삭제
  - n -> p(primary) -> 2(기존에 할당되어 있던 파티션 번호 -> w (반영) -> q (종료)
  ```
  $ sudo resize2fs /dev/mmcblk0p2
  $ sudo raspi-config
  -> 1 Expand Filesystem (선택하면 rebooting 뒤에 반영된다는 메시지가 뜸)
  ```

### 외장하드 마운트
  - http://www.modmypi.com/blog/how-to-mount-an-external-hard-drive-on-the-raspberry-pi-raspian

### 설정 반영
- hostname 및 파티셔닝 변경설정을 적용하기 위해 재부팅
  ```
  $ sudo reboot
  ```
- 재접속하여 hostname과 파티셔닝이 정상적으로 반영되었는지 확인
  ```
  $ hostname
  myhostname
  $ df -h
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/root       7.2G  1.3G  5.7G  18% /
  /dev/sda1      1953480700  416936 1953063764   1% /mnt
  ```

### 분산파일시스템 설치
  - https://www.gluster.org/

### samba
  http://m.cafe.naver.com/openrt/2913

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
