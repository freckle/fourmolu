{ nixpkgs }:
nixpkgs.stable.lib.lists.foldl' (a: b: a // b) { } [
  (import ./aws-cli { inherit nixpkgs; })
  (import ./fourmolu { inherit nixpkgs; })
  (import ./nodejs { inherit nixpkgs; })
]
