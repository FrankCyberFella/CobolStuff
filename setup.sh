#!/bin/bash

# Change this to match your repository root
readonly TEAM_REPO="https://github.com/FrankCyberFella/franksfode-jan-2024"
echo
read -r -p "Enter your name (First Last)? " name
read -r -p "Enter your email? " email

echo
echo "Setting Up Global Configuration Settings"

git config --global user.name "${name}"
git config --global user.email "${email}"
git config --global init.defaultBranch main

echo "Setting up Git Editors and Tools..."

git config --global core.editor "code -w -n"
git config --global credential.helper store
git config branch.main.mergeOptions "--no-edit"

echo "Done."