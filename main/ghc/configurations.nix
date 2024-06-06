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
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc927";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "927" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-2-8 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc928";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "928" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-5 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc945";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "945" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-6 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc946";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "946" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
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
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
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
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
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
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-4 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc964";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "964" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-5 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc965";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "965" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-8-1 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc981";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "981" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages weeder cabal stack ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-10-1 = { packageSelection, enableHLS }:
    let
      nixpkgs = import inputs.nixpkgs-haskell-updates { inherit system; config = { }; };
      name = "ghc910";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [ ghcWithPackages cabal stack ];
    };
}
