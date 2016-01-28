# Mac OS X Key Bindings
  - Home, End, Page Up, Page Down 키를 윈도우처럼 사용하고 싶을 때 적용한다.
  - 자신의 home 디렉토리에 *KeyBindings* 디렉토리를 생성한다.
    ```
    $ cd ~/Library
    $ mkdir KeyBindings
    ```
  - DefaultKeyBinding.dict 파일을 생성하여 각 키에 대한 설정을 적용한다.
    ```
    $ vi DefaultKeyBinding.dict
    ```
    - *i*키를 눌러 입력모드에서 아래 설정값을 입력한 후 *esc* -> *:wq* -> *Return* 순으로 저장 하고 종료한다.
    ```
    {
      /* Remap Home / End keys */
      "\UF729" = "moveToBeginningOfLine:"; /* Home */
      "\UF72B" = "moveToEndOfLine:"; /* End */
      "$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
      "$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
      "^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
      "^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
      "$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
      "$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
    
      /* Remap Page Up and Down keys */
      "\Uf72c" = "pageUp:"; /* Page Up */
      "\Uf72d" = "pageDown:"; /* Page Down */
      "^\Uf72c" = "moveToBeginningOfDocument:"; /* Ctrl + Page Up */
      "^\Uf72d" = "moveToEndOfDocument:"; /* Ctrl + Page Down */
      "$^\Uf72c" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Page Up */
      "$^\Uf72d" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + Page Down */
    }
    ```
  - App을 재실행하거나 Mac을 리부팅하면 설정이 적용된다.
