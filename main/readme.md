This is a kitchen-sink Nix flake for any packages that we want to define
for use at Freckle.

## Package versioning

Since this flake is intended for use across many components and teams, package
names should include version numbers to prepare for the possibility of the flake
supporting multiple versions of a package simultaneously.

Packages should generally be aliased in several ways so that each use site
can choose what level of specificity in the fourmolu version it wants.
For example, we have:

- `fourmolu-default` -
  If you don't care what version of fourmolu you get
- `fourmolu-0-13-x` -
  If you want major version 0.13 but don't care what minor version
- `fourmolu-0-13-0` -
  If you specifically want minor version 0.13.0
