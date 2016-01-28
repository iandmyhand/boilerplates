# Set up Raspberry Pi 2 B & B+ (On Mac OS X)

## Raspbian 설치 및 부팅
- 참고
  - B+ 모델까지는 Ubuntu가 공식지원하지 않기 때문에 다른 버전을 설치하거나 Raspbian을 설치해야 한다.
  - 2B 모델부터는 Snappy Ubuntu Core를 설치할 수 있지만, Snappy는 apt-get이 지원되지도 않고 아직 레퍼런스가 별로 없으니 그냥 Debian 기반인 Raspbian을 설치하자.
- Raspbian 설치(Max OS X 기준. Windows나 Linux를 사용한다면 [이 곳](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)에 가이드가 있다.)
  * [Raspbian download](https://www.raspberrypi.org/downloads/raspbian/) 페이지에서 OS 이미지 파일을 다운받는다. (terminal로만 작업할 경우 RASPBIAN JESSIE LITE를 받으면 된다.)
  * Disk Utility를 실행 후 좌측 패널에서 자신의 SD card를 선택 후, 상단 *Erase* 버튼을 클릭한다.
  * Name은 적당히 입력하고(어차피 OS image를 설치할 때 알아서 바뀐다.) Format은 *MS-DOS (FAT)*을 선택한다.
  * SD card format 완료 후 terminal에서 다음 명령어로 raspbian을 설치한다.
  * <disk# from diskutil> 에는 ```diskutil list```로 찾은 micro SD card의 번호를 입력하면 되겠다.
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
    # 위와 같이 스캔한 IP들이 출력된다. 라즈베리파이로 추정되는 IP로 접속해보자.
    $ ssh pi@<IP>
    ```
  - 모니터/키보드 연결해서 실행하기
    - LAN 선 꼽고 키보드 연결하고 HDMI 선 모니터에 연결하고 마지막에 전원 연결
    - 부팅이 완료되면 할당된 IP가 중간에 나타나니 적어두었다가 접속
    ```$ ssh pi@<IP>```
