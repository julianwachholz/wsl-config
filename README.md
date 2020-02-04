# WSL2 Development Setup and Configuration

This guide will setup a development environment with:

- Windows 10
- Docker
- Windows Subsystem for Linux 2 (WSL2)
  - Git
  - Python
  - Node
- Visual Studio Code

## Windows Setup

1. Signup for Windows Insider Program and follow all updates
2. PowerShell (as Administrator):
   ```pwsh
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

   wsl --set-default-version 2
   wsl --set-version Ubuntu 2
   ```
3. Install Ubuntu from Windows Store
4. Download & install Visual Studio Code
5. Docker Desktop for Windows Edge:  
   - Download from https://docs.docker.com/docker-for-windows/edge-release-notes/
   - Enable WSL 2 Backend
   - Enable integration for Ubuntu

## Ubuntu Setup

1. Start Ubuntu from the Start menu, this will take a while when starting for the first time.
2. Once a login was created:
   ```
   git clone git@github.com:julianwachholz/wsl-config.git
   cd wsl-config && make install
   ```
3. Optional:
   ```
   # create new SSH identity
   ssh-keygen -t ed25519

   # import PGP identity
   gpg --allow-secret-key-import --import /tmp/privkey
   
   # add it to Git
   gpg --list-secret-keys --keyid-format LONG
   git config --global user.signingkey KEYID
   git config --global commit.sign true
   ```
