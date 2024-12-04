{ inputs, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; };
  inherit (nixpkgs.haskell.lib) justStaticExecutables;
in
rec {
  stack-lint-extra-deps-default = stack-lint-extra-deps-1-2-5;

  stack-lint-extra-deps-1-2-2 =
    justStaticExecutables
      inputs.stack-lint-extra-deps-1-2-2.packages.${system}.stack-lint-extra-deps;

  stack-lint-extra-deps-1-2-5 =
    justStaticExecutables
      inputs.stack-lint-extra-deps.packages.${system}.stack-lint-extra-deps;
}
