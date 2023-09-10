#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# chmod u+x __self__.sh

GITURL='github.com'
GITUSER='lukasz-lobocki'

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NOBOLD=$(tput sgr0)
UNDERLINE="\e[4m"
NOUNDERLINE="\e[0m"

echo -e "
${RED}>>> ${NC}Initiating git repo.
"
git init

echo -e "
${RED}>>> ${NC}Initiating go mod.
"
go mod init ${GITURL}/${GITUSER}/{{cookiecutter.__package_slug}}

echo -e "
${RED}>>> ${NC}Adding and commiting ${GREEN}feat:${NC} all.
"
git add --all
git commit -m "feat: Repo initiation."

echo -e "
${RED}>>> ${NC}Creating remote on ${GITURL}.
"
gh repo create "{{cookiecutter.__package_slug}}" --public --description "{{cookiecutter.package_short_description}}"
git branch --move --force main
git remote add origin git@${GITURL}:${GITUSER}/"{{cookiecutter.__package_slug}}"

echo -e "
${RED}>>> ${NC}Adding tag and pushing to ${GITURL}.
"
git tag --annotate v{{cookiecutter.package_version}} -m "Initiation."
git push --set-upstream --tags origin main

echo -e "
${RED}>>> ${NC}Checking goreleaser.
"
goreleaser check

echo -e "
${RED}>>> ${NC}Change dir.
cd ${GREEN}{{cookiecutter.__package_slug}}${NC}
"

echo -e "
${RED}>>> ${NC}Build.
goreleaser ${GREEN}build${NC}
"
