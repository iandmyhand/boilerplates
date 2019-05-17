# Applications

#### [Draw.io](https://www.draw.io/)
- Desktop version: https://about.draw.io/integrations/#integrations_offline

#### [Firefox](https://www.mozilla.org)

#### Git
- ```brew install git```
- git-flow: ```brew install git-flow-avh```

#### [iTerm2](https://www.iterm2.com)
- [sssum.itermcolors](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.itermcolors)
- Alfred Support
    - Go to Alfred Preferences and choose Features. Pick Terminal/Shell and for Application choose Custom. Then paste the [iTerm2 3.0 Alfred Script](https://github.com/iandmyhand/settings/blob/master/MacOSX/iTerm2-3.0AlfredScript.txt)

#### [Notion](https://www.notion.so/)
- All-in-one workspace: Notes, Docs, Knowledge Base, Tasks, Projects, Spreadsheets, Databases

#### [Sublime Text 3](http://www.sublimetext.com/3)
- Packages

    ```
    Command + Shift + P > Install Package > type below packages.
    ```
    
    - [Codecs33](https://github.com/seanliang/Codecs33/tree/osx) for ConvertToUTF8.
    - [ConvertToUTF8](https://github.com/seanliang/ConvertToUTF8) for editing CJK encoding files.

#### [ZSH](https://en.wikipedia.org/wiki/Z_shell)
  
```
$ brew install zsh
/bin/bash
/bin/csh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/zsh
chsh -s /usr/local/bin/zsh
```
    
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    
    ```
    $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
    
- settings
    - [~/.zshrc](https://github.com/iandmyhand/settings/blob/master/MacOSX/.zshrc)
    - [~/.oh-my-zsh/themes/sssum.zsh-theme](https://github.com/iandmyhand/settings/blob/master/MacOSX/sssum.zsh-theme)

#### [direnv](https://direnv.net/)

```
$ brew install direnv
```

Add the following line at the end of the ~/.zshrc file:
`eval "$(direnv hook zsh)"`

# Mac OS X Settings

- [Max OS X Key bindings](https://github.com/iandmyhand/settings/blob/master/MacOSX/MacOSXKeyBinding.md)
    - Home, End, Page Up, Page Down Key를 윈도우처럼 사용하고 싶을 때 적용한다. HHKB2를 이용하고 있다면 매우 유용하다.
