{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-stable-2023-07-25.url = "github:nixos/nixpkgs/6dc93f0daec55ee2f441da385aaf143863e3d671";
    nixpkgs-master-2023-05-06.url = "github:nixos/nixpkgs/16b3b0c53b1ee8936739f8c588544e7fcec3fc60";
    nixpkgs-master-2023-07-18.url = "github:nixos/nixpkgs/08700de174bc6235043cb4263b643b721d936bdb";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        nixpkgsArgs = {
          inherit system;
          config = {
            permittedInsecurePackages = [
              "nodejs-16.20.1"
              "nodejs-16.20.2"
            ];
          };
        };
        nixpkgs = {
          stable = import inputs.nixpkgs-stable nixpkgsArgs;
          stable-2023-07-25 = import inputs.nixpkgs-stable-2023-07-25 nixpkgsArgs;
          master-2023-05-06 = import inputs.nixpkgs-master-2023-05-06 nixpkgsArgs;
          master-2023-07-18 = import inputs.nixpkgs-master-2023-07-18 nixpkgsArgs;
        };
      in
      rec {
        packages = import ./. { inherit nixpkgs; };
        checks = import ./checks.nix { inherit nixpkgs packages; };
      }
    );
}
