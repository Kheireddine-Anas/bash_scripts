#!/bin/bash

# Define aliases
declare -A aliases=(
  [".."]="cd .."
  ["..."]="cd ../.."
  ["c"]="clear"
  ["h"]="history"
  ["q"]="exit"
  ["gs"]="git status"
  ["ga"]="git add"
  ["gc"]="git commit -m"
  ["gp"]="git push"
  ["gpl"]="git pull"
  ["gco"]="git checkout"
  ["gcm"]="git checkout main"
  ["npmi"]="npm install"
  ["nrd"]="npm run dev"
  ["update"]="sudo apt update && sudo apt upgrade"
  ["inst"]="sudo apt install"
  ["reload"]="source ~/.bashrc"
  ["vbsh"]="vim ~/.bashrc"
)

BASHRC="$HOME/.bashrc"
BACKUP="$HOME/.bashrc.bak"

# Backup
cp "$BASHRC" "$BACKUP"
echo "Backup created at $BACKUP"

# Append aliases if not already present
for name in "${!aliases[@]}"; do
  if ! grep -q "alias $name=" "$BASHRC"; then
    echo "alias $name='${aliases[$name]}'" >> "$BASHRC"
    echo "Added alias: $name"
  else
    echo "Alias $name already exists, skipped."
  fi
done

# Reload .bashrc
echo "Reloading .bashrc..."
source "$BASHRC"

echo "✅ All aliases added (or already present). .bashrc reloaded."

