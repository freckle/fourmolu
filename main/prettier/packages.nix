{ inputs, system, ... }:
rec {
  prettier-default = prettier-3-x;

  prettier-2-x = prettier-2-8-x;

  prettier-2-8-x = prettier-2-8-8;
  prettier-2-8-8 =
    let
      nixpkgs = import inputs.nixpkgs-23-05 {
        inherit system;
        config = { };
      };
    in
    nixpkgs.nodePackages.prettier;

  prettier-3-x = prettier-3-2-x;

  prettier-3-0-x = prettier-3-0-3;
  prettier-3-0-3 =
    let
      nixpkgs = import inputs.nixpkgs-23-11 {
        inherit system;
        config = { };
      };
    in
    nixpkgs.nodePackages.prettier;

  prettier-3-2-x = prettier-3-2-5;
  prettier-3-2-5 =
    let
      nixpkgs = import inputs.nixpkgs-stable {
        inherit system;
        config = { };
      };
    in
    nixpkgs.nodePackages.prettier;
}
