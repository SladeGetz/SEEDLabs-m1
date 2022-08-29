# SEEDLabs-m1
Installer script and instructions for getting the SeedLabs Ubuntu 20.04 vm running on Apple Silicon

## Dependencies
* xcode command line tools
* homebrew package manager
* qemu
* Ubuntu20.04 vdi from [Seedlabs](https://seedsecuritylabs.org/labsetup.html)

## Homebrew and Xcode Install
Homebrew will install the xcode command line tools automatically, if you haven't installed yet.
To download Homebrew and learn more about it, you can go to their website at [brew.sh](https://brew.sh) and follow the instructions or paste the following into your Terminal
```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## QEMU Install
```bash
  brew update
  brew install qemu
```

## Ubuntu VM Install
Download and unzip the [Ubuntu 20.04 VM](https://seedsecuritylabs.org/labsetup.html)

## First Time VM Setup
```bash
  git clone https://github.com/SladeGetz/SEEDLabs-m1.git
  cd SEEDLabs-m1
  # assuming that the vm was downloaded and unzipped to your downloads folder
  mv ~/Downloads/SEED-Ubuntu20.04/SEED-Ubuntu20.04.vdi ./backups/SEED-Ubuntu20.04.cleaninstall.vdi
  # using the symlink system will allow the backup script to work
  ln -s ./backups/SEED-Ubuntu20.04.cleaninstall.vdi ./SEED-Ubuntu20.04.vdi
  ./start.sh
```

## Extra Options for the VM
### Backups
Backup your VM: `./backup.sh`
Restore a backup: `./backup.sh ./backups/file`