.PHONY: update

update:
	cp .bashrc .gitconfig .gitignore_global ${HOME}/

install:
	git pull origin master
	bash -e ./setup.sh
	$(MAKE) update

	@echo "*** ALL DONE ***"
	@echo "*** Restart shell to apply ***"
