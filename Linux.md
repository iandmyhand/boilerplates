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

## Appendix
  - system 기본 설정을 바꾸려면? 
    ```$ sudo vi /etc/bash.bashrc```
