{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-24-05.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-22-11.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-23-11.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-stable-2023-07-25.url = "github:nixos/nixpkgs/6dc93f0daec55ee2f441da385aaf143863e3d671";
    nixpkgs-master-2023-05-06.url = "github:nixos/nixpkgs/16b3b0c53b1ee8936739f8c588544e7fcec3fc60";
    nixpkgs-master-2023-07-18.url = "github:nixos/nixpkgs/08700de174bc6235043cb4263b643b721d936bdb";
    nixpkgs-master-2023-09-15.url = "github:nixos/nixpkgs/46688f8eb5cd6f1298d873d4d2b9cf245e09e88e";
    nixpkgs-master-2024-01-27.url = "github:nixos/nixpkgs/160b762eda6d139ac10ae081f8f78d640dd523eb";
    nixpkgs-unstable-2023-10-21.url = "github:nixos/nixpkgs/038b2922be3fc096e1d456f93f7d0f4090628729";
    nixpkgs-unstable-2024-02-20.url = "github:nixos/nixpkgs/b98a4e1746acceb92c509bc496ef3d0e5ad8d4aa";
    nixpkgs-unstable-2024-04-03.url = "github:nixos/nixpkgs/62e885a4013446453b10fd7780eba4337f6f42e0";
    nixpkgs-unstable-2024-05-30.url = "github:nixos/nixpkgs/aa61b27554a5fc282758bf0324781e3464ef2cde";
    nixpkgs-haskell-updates.url = "github:nixos/nixpkgs/haskell-updates";
    flake-utils.url = "github:numtide/flake-utils";
    nix-github-actions.url = "github:nix-community/nix-github-actions";
    nix-github-actions.inputs.nixpkgs.follows = "nixpkgs-stable";
  };
  outputs =
    inputs:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    (inputs.flake-utils.lib.eachSystem systems (system: rec {
      packages = import ./packages.nix { inherit inputs system; };
      lib = import ./lib.nix { inherit inputs system packages; };
      checks = import ./checks.nix {
        inherit
          inputs
          system
          packages
          lib
          ;
      };
    }))
    // {
      nixosModules = import ./nixos-modules.nix { inherit inputs; };
      githubActions = inputs.nix-github-actions.lib.mkGithubMatrix {
        checks = inputs.nixpkgs-stable.lib.getAttrs systems inputs.self.checks;
        platforms = {
          "x86_64-linux" = "ubuntu-22.04";
          "x86_64-darwin" = "macos-12";
          "aarch64-darwin" = "macos-14";
        };
      };
    };
  nixConfig = {
    extra-substituters = [ "https://freckle.cachix.org" ];
    extra-trusted-public-keys = [ "freckle.cachix.org-1:WnI1pZdwLf2vnP9Fx7OGbVSREqqi4HM2OhNjYmZ7odo=" ];
  };
}
