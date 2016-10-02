# このソフトウェアについて #

CheckDirName201610012311は、親ディレクトリ名がリポジトリ名に使える文字だけか判定するVBSスクリプトである。

# 開発環境 #

* Windows XP Pro SP3 32bit
    * cmd.exe
    * CScript/WScript
        * VBScript 5.8

# 背景 #

[CreateRepository201610012001](https://github.com/ytyaru/CreateRepository201610012001)での不足であったリポジトリ名の妥当性チェック処理がしたかった。

# 使い方 #

## 1. リポジトリ名にしたいディレクトリを用意する ##

任意のディレクトリの配下に、ファイル一式を配置する。

* CallVBScript.bat
* CheckDirName.vbs
* dummy_FirstPush.bat

## 2. CallVBScript.batを実行する ##

`CallVBScript.bat`ファイルをダブルクリックで実行する。

## 3. リポジトリ名が不正ならエラーが出る ##

ディレクトリ名は半角英数字と`.`,`-`,`_`の文字だけが有効である。
それ以外の文字があるとエラーになる。

リモートリポジトリがその文字しか使えないため。

### 「デスクトップ」の場合 ###

![Dialog](https://cdn-ak.f.st-hatena.com/images/fotolife/y/ytyaru/20161002/20161002155217.png)
![Console](https://cdn-ak.f.st-hatena.com/images/fotolife/y/ytyaru/20161002/20161002155645.png)

全角文字は使えないためエラー。

### 「C++Dir」の場合 ###

![Dialog](https://cdn-ak.f.st-hatena.com/images/fotolife/y/ytyaru/20161002/20161002155708.png)
![Console](https://cdn-ak.f.st-hatena.com/images/fotolife/y/ytyaru/20161002/20161002155714.png)

`+`記号は使えないためエラー。

### 「CheckDirName201610012311」の場合 ###

![Console](https://cdn-ak.f.st-hatena.com/images/fotolife/y/ytyaru/20161002/20161002155736.png)

半角英数字と`.`,`-`,`_`の文字だけであるため成功。
ダイアログは表示しない。

# ライセンス #

このソフトウェアはCC0ライセンスです。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
