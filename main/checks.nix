{ nixpkgs, packages }:
nixpkgs.stable.lib.lists.foldl' (a: b: a // b) { } [
  (import ./aws-cli/checks.nix { inherit nixpkgs packages; })
  (import ./fourmolu/checks.nix { inherit nixpkgs packages; })
  (import ./nodejs/checks.nix { inherit nixpkgs packages; })
]
