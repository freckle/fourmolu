{ nixpkgs }:
nixpkgs.stable.lib.lists.foldl' (a: b: a // b) { } [
  (import ./fourmolu { inherit nixpkgs; })
  (import ./nodejs { inherit nixpkgs; })
]
