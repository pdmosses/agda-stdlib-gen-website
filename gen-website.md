# Generating a website for a released version

*Assumption*:

- The projects `agda-stdlib` and `agda-stdlib-gen-website` are siblings.

In `pdmosses/agda-stdlib` branch `release-v2.x`:

## Copy fixed files

```sh
mv .github/workflows .disabled
cp -r ../agda-stdlib-gen-website/docs .
cp ../agda-stdlib-gen-website/Makefile .
cp ../agda-stdlib-gen-website/mkdocs.yml .
cp ../agda-stdlib-gen-website/.gitignore .
```

## Update `README.md`

Replace the start of the file to include 

```sh
cp ../agda-stdlib-gen-website/README-new.md .
sd '\A(.|\n)*====*\n' '' README.md
cat README.md >> README-new.md
mv -f README-new.md README.md
```

## Generate Everything

```sh
cp .github/tooling/* .
cabal run GenerateEverything
./index.sh
```

## Generate and browse a website

```sh
make -f Makefile check
make -f Makefile clean-all
make -f Makefile web
make -f Makefile serve
```

## Deploy the website as a new version

```sh
make -f Makefile deploy VERSION=2.x
```