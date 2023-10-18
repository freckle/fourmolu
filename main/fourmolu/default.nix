{ nixpkgs }:
let
  inherit (nixpkgs.stable) haskell;
  inherit (haskell.lib) justStaticExecutables overrideCabal;
in
rec {
  default = v0-13-x;

  v0-13-x = v0-13-0;

  v0-13-0 = justStaticExecutables
    (haskell.packages.ghc96.override {
      overrides = self: super: {
        fourmolu =
          overrideCabal
            (super.callPackage ./haskell-packages/fourmolu-0.13.0.0.cabal.nix { })
            (drv: { doCheck = false; });
      };
    }).fourmolu;
}
