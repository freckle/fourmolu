{ inputs, system, ... }:
rec {
  prettier-default = prettier-3-x;

  prettier-2-x = prettier-2-8-x;

  prettier-2-8-x = prettier-2-8-8;
  prettier-2-8-8 = inputs.nixpkgs-23-05.legacyPackages.${system}.nodePackages.prettier;

  prettier-3-x = prettier-3-2-x;

  prettier-3-0-x = prettier-3-0-3;
  prettier-3-0-3 = inputs.nixpkgs-23-11.legacyPackages.${system}.nodePackages.prettier;

  prettier-3-2-x = prettier-3-2-5;
  prettier-3-2-5 = inputs.nixpkgs-stable.legacyPackages.${system}.nodePackages.prettier;
}
