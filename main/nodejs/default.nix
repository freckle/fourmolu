{ nixpkgs }:
rec {
  nodejs-default = nodejs-16-x;
  nodejs-16-x = nodejs-16-20-x;
  nodejs-16-20-x = nodejs-16-20-2;
  nodejs-16-20-0 = nixpkgs.master-2023-05-06.nodejs_16;
  nodejs-16-20-1 = nixpkgs.master-2023-07-18.nodejs_16;
  nodejs-16-20-2 = nixpkgs.stable.nodejs_16;
}
