# dotfiles

[![CI](https://github.com/ticknical/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/ticknical/dotfiles/actions/workflows/test.yml)

## 概要
macOS環境のセットアップ・管理用dotfilesリポジトリです。各種設定ファイルや初期化スクリプトを管理し、環境構築を自動化します。

## セットアップ方法
1. リポジトリをクローンします。
```sh
git clone https://github.com/ticknical/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. 必要に応じてMakefileを利用してセットアップを実行します。
```sh
make install
```

`make` のみ実行すると、利用可能なコマンドの一覧が表示されます。`make deploy` や `make init` など、個別のタスクを実行することも可能です。

## ディレクトリ構成
```
.
├── Makefile
├── README.md
└── etc/
    └── init/
        ├── 00_brew.sh
        ├── 01_google_drive.sh
        ├── 02_ssh.sh
        ├── 03_atom.sh
        ├── 04_vscode.sh
        ├── 07_dev.sh
        └── constants.sh
```

## 依存関係
- Homebrew
- 各種アプリケーション（Dropbox, Google Drive, Atom, VSCode など）

## ライセンス
Copyright &copy; 2018 Tick Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
