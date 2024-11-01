# Applications

## Editor/Note

### [Notion](https://www.notion.so/)
- All-in-one workspace: Notes, Docs, Knowledge Base, Tasks, Projects, Spreadsheets, Databases

### [Visual Studio Code](https://code.visualstudio.com/download)
- Lightweight Code Editor that provides CoPilot!

### [Sublime Text 3](http://www.sublimetext.com/3)
- Lightweight Text Editor that supports Linux, Mac OS, and Windows.
- Packages

    ```
    Command + Shift + P > Install Package > Type the packages below.
    ```
    
    - [Codecs33](https://github.com/seanliang/Codecs33/tree/osx) for ConvertToUTF8.
    - [ConvertToUTF8](https://github.com/seanliang/ConvertToUTF8) for editing CJK encoding files.



## for Productivity

### [1Password](https://1password.com/downloads/)
1Password is the easiest way to store and use strong passwords.

### [Alfred](https://www.alfredapp.com/help/getting-started/install/)
- Alfred boosts your efficiency with hotkeys, keywords, text expansion, and more. Search your Mac and the web, and be more productive with custom actions to control your Mac.
- **For Koreans**
    - Naver Search Workflow: [alfnaversearch](https://github.com/Kuniz/alfnaversearch/releases)

### [Chrome](https://www.google.com/chrome/)
- General browser.
- Extensions
    - [Grammarly](https://chrome.google.com/webstore/detail/grammarly-grammar-checker/kbfnbcaeplbcioakkpcpgfkobkghlhen)
        - English Grammar Checker and AI Writing App
    - [GoFullPage](https://chrome.google.com/webstore/detail/gofullpage-full-page-scre/fdpohaocaechififmbbbbbknoalclacl)
        - A Full Page Screen Capture tool that enables you to capture web pages in PDF, PNG, and other formats.
    - [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
        - A powerful subscription-based password manager.
    - [META SEO inspector](https://chromewebstore.google.com/detail/meta-seo-inspector/ibkclpciafdglkjkcibmohobjkcfkaef)
        -  Easily inspect the metadata found inside web pages, find issues, and get advice on how to fix them.
    - [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
        - React Developer Tools is a Chrome DevTools extension for the open-source React JavaScript library. It allows you to inspect the React component hierarchies in the Chrome Developer Tools.
    - **For Koreans Only**
        - [Naver English Dictionary](https://chrome.google.com/webstore/detail/%EB%84%A4%EC%9D%B4%EB%B2%84-%EC%98%81%EC%96%B4%EC%82%AC%EC%A0%84-naver-english-di/jfibpeiddefellcfgnijpcpddoimbdij?hl=en)
            - Korean-English Dictionary. Just double-click English words that you do not understand.

### [Dropbox](https://www.dropbox.com/desktop)
- File sharing.

### [Draw.io](https://www.draw.io/)
- Desktop version: https://about.draw.io/integrations/#integrations_offline
- Google Drive supports Draw.io through the Google Workspace Marketplace.

### [Figma](https://www.figma.com/)

### [Microsoft To Do](https://todo.microsoft.com/)

### [Bandizip](https://kr.bandisoft.com/bandizip.mac/)

### [Rectangle](https://rectangleapp.com/)
- Move and resize windows in macOS using keyboard shortcuts or snap areas
- Settings
    - Check 'Launch on login'
    - Check 'Check for updates automatically'
    - Import the previous settings.

### [Xnapper](https://xnapper.com/)
- Beautify screenshots.


## Messager

### [Slack](https://slack.com/)

### [Telegram](https://telegram.org/)

### [Line](https://line.me/)

### [KakaoTalk](https://www.kakaocorp.com/page/service/service/KakaoTalk)


## For Software Development

### [iTerm2](https://www.iterm2.com)
- [sssum.itermcolors](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.itermcolors)
- Alfred Support
    - Go to Alfred Preferences and choose Features. Pick Terminal/Shell, and for Application choose Custom. Then paste the [iTerm2 3.0 Alfred Script](https://github.com/iandmyhand/settings/blob/master/MacOSX/iTerm2-3.0AlfredScript.txt)
- [inshellisense](https://github.com/microsoft/inshellisense)
    - inshellisense provides IDE style autocomplete for shells.

### [Homebrew](https://docs.brew.sh/Installation)

### figlet

```
brew install figlet
```

### lolcat

```
brew install lolcat
```

### [ZSH](https://en.wikipedia.org/wiki/Z_shell)
    
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    
    ```
    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    
- settings
    - [~/.zshrc](https://github.com/iandmyhand/settings/blob/master/MacOSX/.zshrc)
    - [~/.vimrc](https://github.com/iandmyhand/boilerplates/blob/master/UNIX/.vimrc)
    - [~/.oh-my-zsh/themes/sssum.zsh-theme](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.zsh-theme)

### Git
- ```brew install git```
- git-flow: ```brew install git-flow-avh```

### [python3](https://www.python.org/)

```
brew install python3
```

### [node.js](https://nodejs.org/)

```
brew install node
```

### [direnv](https://direnv.net/)

```
$ brew install direnv
```

Add the following line at the end of the ~/.zshrc file:
`eval "$(direnv hook zsh)"`

### [starship](https://starship.rs/)

### [Better Commits](https://github.com/Everduin94/better-commits)


# Mac OS X Settings 

## HHKB2
- [Max OS X Key bindings](https://github.com/iandmyhand/settings/blob/master/MacOSX/MacOSXKeyBinding.md)
    - Apply this to use the Home, End, Page Up, and Page Down Keys like Windows for HHKB2(Happy Hacking KeyBoard 2).

## Hangeul
- Command + Space로 한영전환하기:
    - System Settings > Keyborad > Keyboard Shortcuts... > Input Sources > 'Select the previous input source'의 단축키 부분 더블클릭 후 Command + Space 입력
    - System Settings > Keyborad > Keyboard Shortcuts... > Spotlight > 'Show Spotlight search'와 'Show Finder search window' 둘 다 체크 해제
- Capslock 키를 원래대로 Capslock으로 사용하기:
    - System Settings > Keyborad > Text Input > Input Sources > Edit > 'Use the 한/A key to switch to and from ABC' 끄기
