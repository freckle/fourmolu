{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-stable-2023-07-25.url = "github:nixos/nixpkgs/6dc93f0daec55ee2f441da385aaf143863e3d671";
    nixpkgs-master-2023-05-06.url = "github:nixos/nixpkgs/16b3b0c53b1ee8936739f8c588544e7fcec3fc60";
    nixpkgs-master-2023-07-18.url = "github:nixos/nixpkgs/08700de174bc6235043cb4263b643b721d936bdb";
    nixpkgs-master-2023-09-15.url = "github:nixos/nixpkgs/46688f8eb5cd6f1298d873d4d2b9cf245e09e88e";
    nixpkgs-unstable-2023-10-21.url = "github:nixos/nixpkgs/038b2922be3fc096e1d456f93f7d0f4090628729";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      rec {
        packages = import ./packages.nix { inherit inputs system; };
        lib = import ./lib.nix { inherit inputs system packages; };
        checks = import ./checks.nix { inherit inputs system packages; };
      }
    );
}
