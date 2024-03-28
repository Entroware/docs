#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "> ${GREEN}Preparing environment${NC}"
git worktree remove public --force || true # prevent error from stopping script
rm -rf public

echo -e "> ${GREEN}Mapping gh-pages to public${NC}"
git worktree add public gh-pages

echo -e "> ${GREEN}Building into public${NC}"
rm -rf public/* public/.gitignore
hugo

while true; do
  echo -en "> ${YELLOW}Publish to gh-pages? [Y/N]${NC} "
  read -r yn
  case ${yn} in
      [Yy]* ) break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
  esac
done
cd public
echo "docs.entroware.com" >> CNAME
echo "*.css.map" >> .gitignore # prevent dev path names being published
git rm -rfq --cached . || true # unlink all found removed files
git add --all
git commit -m "Build $(date +%s)"
git push origin gh-pages
