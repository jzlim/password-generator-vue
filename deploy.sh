# deploy.sh

#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run lint
npm run build

# navigate into the build output directory
cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:jzlim/password-generator-vue.git master:gh-pages

cd -