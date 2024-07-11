{ inputs, system, ... }:
let
  v16 = import ./v16.nix { inherit inputs system; };
  v18 = import ./v18.nix { inherit inputs system; };
  v20 = import ./v20.nix { inherit inputs system; };
  versions = v16 // v18 // v20;
in
versions // { nodejs-default = versions.nodejs-20-x; }
