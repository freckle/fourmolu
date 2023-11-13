{ inputs, system }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) lib;
  packages = lib.lists.foldl' (a: b: a // b) { } [
    (import ./aws-cli/packages.nix { inherit inputs system packages; })
    (import ./fourmolu/packages.nix { inherit inputs system packages; })
    (import ./ghc/packages.nix { inherit inputs system packages; })
    (import ./nodejs/packages.nix { inherit inputs system packages; })
    (import ./prettier/packages.nix { inherit inputs system packages; })
  ];
in
packages
