{ nixpkgs }:
let
  versions = v0-13 // v0-14 // {
    fourmolu-default = versions.fourmolu-0-13-x;
  };

  v0-13 =
    let
      inherit (nixpkgs.stable-2023-07-25) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
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
    };

  v0-14 =
    let
      inherit (nixpkgs.stable) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
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
    };

in
versions
