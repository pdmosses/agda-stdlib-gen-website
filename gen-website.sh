#!/bin/sh

# Generate a website for a version of agda-stdlib

# WARNING:
# NOT YET TESTED FOR POTENTIAL FAILURES

# Usage:
# cd agda-stdlib-gen-website
# sh gen-website.sh

# Assumption:
# The projects `agda-stdlib` and `agda-stdlib-gen-website` are siblings.

cd ../agda-stdlib

# Refer to fork https://github.com/pdmosses/agda-stdlib instead of upstream repo
cp ../agda-stdlib-gen-website/ci-ubuntu.yml .github/workflows/

echo Copy fixed files

cp -r ../agda-stdlib-gen-website/docs .
cp ../agda-stdlib-gen-website/Makefile .
cp ../agda-stdlib-gen-website/mkdocs.yml .
cp ../agda-stdlib-gen-website/.gitignore .
cp ../agda-stdlib-gen-website/skip.txt .

echo Update README.md

cp ../agda-stdlib-gen-website/README-new.md .
sd '\A(.|\n)*====*\n' '' README.md
cat README.md >> README-new.md
mv -f README-new.md README.md

echo Generate Everything

cp .github/tooling/* .
cabal run GenerateEverything
./index.sh

echo Generate a website

make -f Makefile check
make -f Makefile clean-all
make -f Makefile web