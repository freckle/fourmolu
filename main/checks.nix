{ inputs, packages, system, lib }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  flattenAttrs = nixpkgs.lib.lists.foldl' (a: b: a // b) { };
  files = [
    ./aws-cli/checks.nix
    ./fourmolu/checks.nix
    ./ghc/checks.nix
    ./nodejs/checks.nix
    ./prettier/checks.nix
  ];
in
flattenAttrs (
  nixpkgs.lib.lists.map
    (file: import file { inherit inputs packages lib system; })
    files
)
