DOTPATH           := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_EXCLUDES := .DS_Store .git .github .idea
DOTFILES          := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

.DEFAULT_GOAL := help

## Show dot files in this repo
list:
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

## Create symlink to home directory
deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

## execute initialize scripts
init:
	@echo '==> Start to execute initialize scripts.'
	@echo ''
	@$(foreach val, $(wildcard $(DOTPATH)/etc/init/[0-9]*.sh), echo "==> execute... [$(val)]"; bash $(val);)

## Fetch changes for this repo
update:
	@echo '==> Start to update dotfiles repository.'
	@echo ''
	git pull origin master

## Run make update, deploy, init
install:
	@make update
	@make deploy
	@make init

## Run workspace backup
backup:
	@echo '==> Start to backup dev workspace.'
	@echo ''
	DEST_DIR="$(HOME)/Google Drive/マイドライブ/.dotfiles/dev/"; \
	BACKUP_FILE="$(DOTPATH)/$(shell date +%Y%m%d%H%M%S).tar.bz2"; \
	[ -d "$$DEST_DIR" ] || mkdir -p "$$DEST_DIR"; \
	tar cvjf "$$BACKUP_FILE" $(HOME)/dev/* && \
	mv "$$BACKUP_FILE" "$$DEST_DIR"
	@echo ''
	@echo '==> Backup completed.'

## Run photo library backup
backup-photo:
	@echo '==> Start to backup photo library.'
	@echo ''
	DEST_DIR="$(HOME)/Google Drive/マイドライブ/etc/backup/photo/"; \
	BACKUP_FILE="$(DOTPATH)/$(shell date +%Y%m%d%H%M%S).tar.bz2"; \
	[ -d "$$DEST_DIR" ] || mkdir -p "$$DEST_DIR"; \
	tar cvjf "$$BACKUP_FILE" $(HOME)/Pictures/* && \
	mv "$$BACKUP_FILE" "$$DEST_DIR"
	@echo ''
	@echo '==> Backup completed.'

## Self-documented Makefile
help:
	@echo '       __      __  _____ __         '
	@echo '  ____/ /___  / /_/ __(_) /__  _____'
	@echo ' / __  / __ \/ __/ /_/ / / _ \/ ___/'
	@echo '/ /_/ / /_/ / /_/ __/ / /  __(__  ) '
	@echo '\__,_/\____/\__/_/ /_/_/\___/____/  '
	@echo ''
	@echo 'list      : dotfilesリポジトリ内のファイル一覧を表示'
	@echo 'deploy    : dotfilesをホームディレクトリにシンボリックリンク作成'
	@echo 'init      : 初期化スクリプトを実行'
	@echo 'update    : dotfilesリポジトリを最新化'
	@echo 'install   : dotfilesのインストールを実行'
	@echo 'backup    : devワークスペースのバックアップ'
	@echo 'help      : このヘルプを表示'
