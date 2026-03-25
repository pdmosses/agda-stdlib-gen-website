A fork of the Agda standard library
===================================

The standard library aims to contain all the tools needed to write both
programs and proofs easily. While we always try and write efficient
code, we prioritize ease of proof over type-checking and normalization
performance. If computational performance is important to you, then
perhaps try [agda-prelude](https://github.com/UlfNorell/agda-prelude)
instead.

## Getting started

If you're looking to find your way around the library, there are several
different ways to get started:

- The library's structure and the associated design choices are described
in the [README.agda](https://github.com/agda/agda-stdlib/tree/master/doc/README.agda).

- The [README folder](https://github.com/agda/agda-stdlib/tree/master/doc/README),
which mirrors the structure of the main library, contains examples of how to
use some of the more common modules. Feel free to [open a new issue](https://github.com/agda/agda-stdlib/issues/new) if there's a particular module you feel could do with
some more documentation.

- You can [browse the library's source code](https://agda.github.io/agda-stdlib/)
in glorious clickable HTML.

## Alternative website generation (experimental)

> [!TIP]
> You can generate a website with *hierarchical navigation menus* and
> a toggle for switching between *light and dark mode*!

See https://pdmosses.github.io/agda-stdlib/ for a prototype.

-   You can generate the website by the following commands:
    
    ```sh
    make -f Makefile check
    make -f Makefile web
    ```

-   You can preview the generated website locally by:
    
    ```sh
    make -f Makefile serve
    ```

-   You can deploy the generated website to GitHub Pages *without* versioning
    by updating the site and repo data in `mkdocs.yml` then running:
    
    ```sh
    make -f Makefile deploy
    ```

-   You can deploy the generated website to GitHub Pages as a *versioned* site
    with *initial* version `v` by:
    
    ```sh
    make -f Makefile start-versioning
    make -f Makefile deploy VERSION=v
    ```

    A version selector is then shown at the top of each page. Version
    identifiers that "look like" versions (e.g. `1.2.3`, `1.0b1`, `v1.0`)
    are treated as ordinary versions, whereas other identifiers, like `dev`,
    are treated as development versions, and placed above ordinary versions.

    You can make an *already-deployed* version `v` the *default version* and
    set the *default alias* to point to it by:

    ```sh
    make -f Makefile default VERSION=v
    ```
    
    Then the website home page redirects to version `v`, and URLs of the form
    `.../default/...` redirect to `.../v/...`.

    Deploying a new version does *not* change the default.

    When deploying the generated website as a *new* version, other deployed
    versions of the website remain untouched. If you deploy it with an
    *existing* version identifier, that version is thereby updated.

    To remove a deployed version `v` *other than the current default* run:

    ```sh
    make -f Makefile delete VERSION=v
    ```
 
    Finally, you can list all the currently deployed versions of your website:
    
    ```sh
    make -f Makefile list-versions
    ```

See the [additional installation instructions](https://pdmosses.github.io/agda-stdlib/default/installation-guide/)
for the software dependencies of the experimental website generation.
