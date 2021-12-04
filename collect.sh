#!/usr/bin/env bash

cp ../blogP/themes/hexo-theme-next/source/css/_schemes/Mist/_layout.styl ./themes/hexo-theme-next/source/css/_schemes/Mist/
cp ../blogP/_config.yml .
cp ../blogP/package.json .
# cp ../blogP/node_modules/kramed/lib/rules/inline.js ./node_modules/kramed/lib/rules/inline.js
cp ../blogP/themes/hexo-theme-next/_config.yml ./themes/hexo-theme-next/_config.yml
cp -R ../blogP/source .

