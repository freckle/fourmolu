{ inputs, system }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) lib;
  packages = lib.lists.foldl' (a: b: a // b) { } [
    (import ./aws-cli { inherit inputs system packages; })
    (import ./fourmolu { inherit inputs system packages; })
    (import ./nodejs { inherit inputs system packages; })
    (import ./prettier { inherit inputs system packages; })
  ];
in
packages
