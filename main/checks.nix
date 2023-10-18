{ nixpkgs, packages }:
nixpkgs.stable.lib.lists.foldl' (a: b: a // b) {} [
  (import ./fourmolu/checks.nix { inherit nixpkgs packages; })
  (import ./nodejs/checks.nix { inherit nixpkgs packages; })
]
