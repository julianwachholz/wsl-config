#!/usr/bin/env bash

# Setup the Ubuntu subsystem

# Update everything
sudo apt update && sudo apt upgrade -y

# Install additional dependencies
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
direnv bash-completion apt-transport-https ca-certificates gnupg

# Install pyenv
[ ! $(which pyenv) ] && curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Install nvm and latest node version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install node

# Setup bash alias completion
[ -d complete-alias ] && cd complete-alias && git pull && cd ..
[ ! -d complete-alias ] && git clone https://github.com/cykerway/complete-alias.git
cat complete-alias/complete_alias > $HOME/.bash_completion
echo 'complete -F _complete_alias g' >> $HOME/.bash_completion
echo 'complete -F _complete_alias dc' >> $HOME/.bash_completion

# Load SSH keys on demand
echo "AddKeysToAgent yes" > $HOME/.ssh/config
