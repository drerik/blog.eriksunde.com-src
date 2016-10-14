#!/bin/bash
if [[ ! -d themes/eriksunde.com-theme-redlounge ]]; then
  git clone git@github.com:drerik/eriksunde.com-theme-redlounge.git themes/eriksunde.com-theme-redlounge
fi

if [[ -d public ]]; then
  rm -rf public
  git clone git@github.com:drerik/drerik.github.io.git public
fi
hugo
cd public
git add -A .
git commit -a -m "site update $(date +%Y-%m-%d-%H-%M-%S)"
git push
