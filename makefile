.PHONY: update

USERNAME=`cmd.exe /c echo %USERNAME% | sed -e 's/\r//g'`

update:
	cp .bashrc .gitconfig .gitignore_global ${HOME}/
	cp vscode/* "/mnt/c/Users/${USERNAME}/AppData/Roaming/Code/User/"

install:
	git pull origin master
	bash -e ./setup.sh
	$(MAKE) update

	@echo "*** ALL DONE ***"
	@echo "*** Restart shell to apply ***"
