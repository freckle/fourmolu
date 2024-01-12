{ inputs, system }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin;

  addPatches = patches: prev: { patches = (prev.patches or [ ]) ++ patches; };

  ghcOverlay = ghcVersion: override: final: prev: prev // {
    haskell = prev.haskell // {
      compiler = prev.haskell.compiler // {
        ${ghcVersion} = prev.haskell.compiler.${ghcVersion}.overrideAttrs override;
      };
    };
  };
in
{
  ghc-9-2-7 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable-2023-07-25 {
        inherit system;
        config = { };
        overlays = [
          (ghcOverlay "ghc927" (addPatches [ ./sanity-check-find-file-name.patch ]))
        ];
      };
      name = "ghc927";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "927" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-2-8 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 { inherit system; config = { }; };
      name = "ghc928";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "928" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-6 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-23-05 { inherit system; config = { }; };
      name = "ghc946";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "946" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-7 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc947";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "947" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-8 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc948";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "948" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-3 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc963";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "963" ]; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder ] ++ (if enableHLS then [ hls ] else [ ]);
    };
}
