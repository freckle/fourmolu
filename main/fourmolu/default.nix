{ nixpkgs }:
let
  inherit (nixpkgs.stable) haskell;
  inherit (haskell.lib) justStaticExecutables overrideCabal;
in
rec {
  default = version-0-13-x;

  version-0-13-x = version-0-13-0;

  version-0-13-0 = justStaticExecutables
    (haskell.packages.ghc96.override {
      overrides = self: super: {
        fourmolu =
          overrideCabal
            (super.callPackage ./haskell-packages/fourmolu-0.13.0.0.cabal.nix { })
            (drv: { doCheck = false; });
      };
    }).fourmolu;
}
