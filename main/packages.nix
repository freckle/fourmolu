{ inputs, system }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  flattenAttrs = nixpkgs.lib.lists.foldl' (a: b: a // b) { };
  files = [
    ./aws-cli/packages.nix
    ./cypress/packages.nix
    ./fourmolu/packages.nix
    ./ghc/packages.nix
    ./nodejs/packages.nix
    ./prettier/packages.nix
  ];
  packages =
    flattenAttrs
      (
        nixpkgs.lib.lists.map
          (file: import file { inherit inputs packages system; })
          files
      );
in
packages
