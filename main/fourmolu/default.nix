{ nixpkgs }:
let
  inherit (nixpkgs.stable-2023-07-25) haskell;
  inherit (haskell.lib) justStaticExecutables overrideCabal;
in
rec {
  fourmolu-default = fourmolu-0-13-x;

  fourmolu-0-13-x = fourmolu-0-13-1;

  fourmolu-0-13-0 = justStaticExecutables
    (haskell.packages.ghc96.override {
      overrides = self: super: {
        fourmolu =
          overrideCabal
            (super.callPackage ./haskell-packages/fourmolu-0.13.0.cabal.nix { })
            (drv: { doCheck = false; });
      };
    }).fourmolu;

  fourmolu-0-13-1 = justStaticExecutables
    (haskell.packages.ghc96.override {
      overrides = self: super: {
        fourmolu =
          overrideCabal
            (super.callPackage ./haskell-packages/fourmolu-0.13.1.cabal.nix { })
            (drv: { doCheck = false; });
      };
    }).fourmolu;

  fourmolu-0-14-x = fourmolu-0-14-0;

  fourmolu-0-14-0 = justStaticExecutables
    (haskell.packages.ghc96.override {
      overrides = self: super: {
        fourmolu =
          overrideCabal
            (super.callPackage ./haskell-packages/fourmolu-0.14.0.cabal.nix { })
            (drv: { doCheck = false; });
      };
    }).fourmolu;
}
