{ nixpkgs }:
rec {
  prettier-default = prettier-2-8-8;
  prettier-2-x = prettier-2-8-x;
  prettier-2-8-x = prettier-2-8-8;
  prettier-2-8-8 = nixpkgs.stable.nodePackages.prettier;
}
