#!/bin/bash

REDUCED_REMOTE="git@github.com:instruct-br/puppet-reduced_stdlib.git"
CURRENT_DATE=$(date)

rm -rf puppetlabs-stdlib

git clone https://github.com/puppetlabs/puppetlabs-stdlib.git

cd puppetlabs-stdlib || exit

GIT_COMMIT=$(git rev-parse HEAD)

git rm -r lib/facter
git rm -r spec/unit/facter/
git rm -r locales

# shellcheck disable=SC2002
cat ../deprecated-functions.txt | while read -r f; do
  git rm "lib/puppet/functions/${f}.rb"
  git rm "lib/puppet/parser/functions/${f}.rb"
  git rm "spec/functions/${f}_spec.rb"
done

git rm lib/puppet/type/anchor.rb
git rm spec/unit/puppet/type/anchor_spec.rb
git rm spec/acceptance/anchor_spec.rb

git mv README.md README.original.md

cp ../README.reduced.md README.md
cp ../deprecated-functions.txt .
cp ../metadata.json .

git add README.md
git add deprecated-functions.txt

git commit -a -m "Reduced commit ${GIT_COMMIT} on ${CURRENT_DATE}"
git remote rm origin
git remote add reduced $REDUCED_REMOTE

