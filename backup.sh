#!/bin/bash

function usage() {
  echo Must be in the SEEDLabs-m1 directory
  echo No arguments creates a backup of the current VM image
  echo One argument will refer to the backup that the start script points to
  echo For example:
  echo '    ./backup.sh ./backups/<date-time>SEED-Ubuntu20.04.vdi'
  exit 0
}

if [[ $( basename "$(pwd)" ) != "SEEDLabs-m1" ]]; then
  usage
fi

if [[ $# -eq 0 ]]; then
  backup_file="$(date -u +'%Y-%m-%d_%H:%M_')SEED-Ubuntu20.04.vdi"
  cp ./SEED-Ubuntu20.04.vdi ./backups/$backup_file
  echo "Succesfully backed up to $(pwd)/backups/$backup_file" 
  exit 0
fi

if [[ $# -ne 1 ]]; then
  usage
fi

if [[ -f $1 ]]; then
  ln -s $1 ./SEED-Ubuntu20.04.vdi
  echo "Succesfully restored backup"
  exit 0
fi

usage