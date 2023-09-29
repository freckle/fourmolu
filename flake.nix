{
  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        nixpkgsArgs = { inherit system; config = { }; };
        nixpkgs = {
          stable = import inputs.stable nixpkgsArgs;
          unstable = import inputs.unstable nixpkgsArgs;
        };
      in
        {
          packages = import ./. {
            inherit (nixpkgs.stable) haskell;
            inherit (nixpkgs.unstable) all-cabal-hashes;
          };
        }
    );
}
