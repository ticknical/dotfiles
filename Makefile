DOTPATH           := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_EXCLUDES := .DS_Store .git .github
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
	@$(foreach val, $(wildcard $(DOTPATH)/etc/init/*.sh), echo "==> execute... [$(val)]"; bash $(val);)

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

## Self-documented Makefile
help:
	@echo '       __      __  _____ __         '
	@echo '  ____/ /___  / /_/ __(_) /__  _____'
	@echo ' / __  / __ \/ __/ /_/ / / _ \/ ___/'
	@echo '/ /_/ / /_/ / /_/ __/ / /  __(__  ) '
	@echo '\__,_/\____/\__/_/ /_/_/\___/____/  '
