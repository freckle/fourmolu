{ haskell, all-cabal-hashes, ... }:
let
  inherit (haskell.lib) justStaticExecutables overrideCabal;
in
  rec {
    default = fourmolu;

    fourmolu = fourmolu-0-13;

    fourmolu-0-13 = fourmolu-0-13-0;

    fourmolu-0-13-0 = justStaticExecutables
      (haskell.packages.ghc96.override {
        overrides = self: super: {
          fourmolu =
            overrideCabal
              (super.callPackage ./fourmolu-0.13.0.0.nix { })
              (drv: { doCheck = false; });
        };
      }).fourmolu;
  }
