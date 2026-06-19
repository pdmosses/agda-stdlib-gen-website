#!/bin/sh

# Generate a website for a version of agda-stdlib

# Usage:
# cd agda-stdlib-gen-website
# sh gen-website.sh

# Assumption: agda-stdlib, agda-stdlib-gen-website, agda2website are siblings

cd ../agda-stdlib

mkdir -p website

# Copy agda2website to website for local testing

cp -R ../agda2website/ website/agda2website

# Copy agda-stdlib-gen-website/website files:
#  - docs/
#  - Makefile
#  - mkdocs.yml

cp -R ../agda-stdlib-gen-website/website/ website

# Copy agda-stdlib-gen-website/tooling files:
#  - landing-top.html
#  - landing.sh

cp -R ../agda-stdlib-gen-website/tooling/ .github/tooling

# Patch .github/workflows/ci-ubuntu.yml:

sd  'https://github.com/agda/agda-stdlib' \
    'https://github.com/${{ env.GITHUB_REPOSITORY }}' \
    .github/workflows/ci-ubuntu.yml

# Generate and preview the website:

cd website

make index
make check
make web
make serve

echo "To publish the website: make deploy VERSION=..."
