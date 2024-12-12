{ inputs, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-24-11 { inherit system; };
  inherit (nixpkgs.haskell.lib) justStaticExecutables;
  inherit (builtins) getFlake;
in
rec {
  stack-lint-extra-deps-default = stack-lint-extra-deps-1-3-0;

  stack-lint-extra-deps-1-2-2 =
    justStaticExecutables
      (getFlake "github:freckle/stack-lint-extra-deps/0dccbb297a4bdc01509e2e18c8e3f726014bc35a")
      .packages.${system}.stack-lint-extra-deps;

  stack-lint-extra-deps-1-2-5 =
    justStaticExecutables
      (getFlake "github:freckle/stack-lint-extra-deps/18bb6cade3ebc8c5b0aca38da75f5c717fa2d467")
      .packages.${system}.stack-lint-extra-deps;

  stack-lint-extra-deps-1-3-0 =
    justStaticExecutables
      inputs.stack-lint-extra-deps.packages.${system}.stack-lint-extra-deps;
}
