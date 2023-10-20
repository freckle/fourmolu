{ inputs, system, packages }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) lib;
in
lib.lists.foldl' (a: b: a // b) { } [
  (import ./aws-cli/checks.nix { inherit inputs packages system; })
  (import ./fourmolu/checks.nix { inherit inputs packages system; })
  (import ./nodejs/checks.nix { inherit inputs packages system; })
  (import ./prettier/checks.nix { inherit inputs packages system; })
]
