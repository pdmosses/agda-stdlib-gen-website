# Assumption: This Makefile and agda2website are siblings
# in a subdirectory of the agda-stdlib repository.

MODULES := index
SOURCES := .. ../doc ../src
PROTECT := docs/About.md docs/User-Guide.md

include agda2website/Makefile.include

# `make index` generates Agda files:
#  - ../Everything.agda
#  - ../EverythingSafe.agda
#  - ../index.agda

.PHONY: index
index:
	@cd ..; \
	cp .github/tooling/* .; \
	cabal run GenerateEverything; \
	./index.sh
	@echo "Generated Everything and index Agda files"

# `make check` loads ../index.agda
# `make web`   generates a website in docs
# `make serve` serves a local preview of the website
# `make deploy VERSION=...` publishes the website at nav/.../
