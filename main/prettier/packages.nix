{ inputs, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
in
rec {
  prettier-default = prettier-2-8-8;
  prettier-2-x = prettier-2-8-x;
  prettier-2-8-x = prettier-2-8-8;
  prettier-2-8-8 = nixpkgs.nodePackages.prettier;
}
