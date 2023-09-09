#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# chmod u+x __self__.sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NOBOLD=$(tput sgr0)
UNDERLINE="\e[4m"
NOUNDERLINE="\e[0m"

echo {{cookiecutter.__package_slug}}
echo {{cookiecutter.package_short_description}}
echo {{cookiecutter.package_version}}

echo -e "
${RED}>>> ${NC}Initiating git repo.
"
git init

echo -e "
${RED}>>> ${NC}Initiating go mod.
"
go mod init main


echo -e "
${RED}>>> ${NC}Adding and commiting ${GREEN}feat:${NC} all.
"
git add --all
git commit -m "feat: Repo initiation."

echo -e "
${RED}>>> ${NC}Creating remote on GitHub.
"
gh repo create "{{cookiecutter.__package_slug}}" --public --description "{{cookiecutter.package_short_description}}"
git branch --move --force main
git remote add origin git@github.com:lukasz-lobocki/"{{cookiecutter.__package_slug}}"


echo -e "
${RED}>>> ${NC}Adding tag and pushing to GitHub.
"
git tag --annotate v{{cookiecutter.package_version}} -m "Init."
git push --set-upstream --tags origin main

echo -e "
${RED}>>> ${NC}Checking goreleaser.
"
goreleaser check
