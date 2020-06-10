# MacPorts Fonts

This is a [MacPorts](https://www.macports.org/) portfile repository offering
ports for system fonts.

These are OpenType, TrueType, etc. fonts that install to `/Library/Fonts` for
use throughout the OS in "regular" applications. This stands in contrast to the
fonts offered in the default MacPorts repository, which are only installed and
configured for use in X11.

# Included fonts

Currently most fonts fall into one of two categories:

- Monospaced fonts designed for code
- CJK fonts, especially Japanese

Only fonts with permissive licenses have direct downloads setup. Fonts with
restrictive licenses can be included but will require manually obtaining the
distfiles.

# Usage

Clone this repository somewhere:

```sh
git clone https://github.com/amake/macports-fonts.git
```

Optionally set up automatic index refresh:

```sh
cd macports-fonts
make hooks
```

Add the entry to your MacPorts sources config (by default at
`/opt/local/etc/macports/sources.conf`):

```
### comments

file:///path/to/your/clone/of/macports-fonts  # <- add this
rsync://rsync.macports.org/macports/release/tarballs/ports.tar [default]
```

See also the MacPorts Guide chapter on [Local Portfile
Repositories](https://guide.macports.org/chunked/development.local-repositories.html).
