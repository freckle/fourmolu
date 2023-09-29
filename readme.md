This Nix flake provides [fourmolu].

It's aliased in several ways (e.g. `fourmolu`, `fourmolu-0.13`,
`fourmolu-0.13.0`) so that each dev shell can choose what level
of specificity in the fourmolu version it wants. So if you want
major version 0.13 but don't care what minor version, you can
select `fourmolu-0.13`.

  [fourmolu]: https://hackage.haskell.org/package/fourmolu
