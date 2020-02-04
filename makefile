.PHONY: update

update:
	cp .bashrc .gitconfig .gitignore_global ${HOME}/
	cp vscode/* /mnt/c/Users/jwa/AppData/Roaming/Code/User/

install:
	git pull origin master
	bash -e ./setup.sh
	$(MAKE) update

	@echo "*** ALL DONE ***"
	@echo "*** Restart shell to apply ***"
