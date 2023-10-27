{ inputs, system, packages, ... }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin;
in
rec {
  ghc-9-2-7 =
    let
      nixpkgs = import inputs.nixpkgs-stable-2023-07-25 { inherit system; config = { }; };
      name = "ghc927";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghc = haskell.compiler.${name};
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghc weeder ]; };
  ghc-9-2-8 =
    let
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 { inherit system; config = { }; };
      name = "ghc928";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghc = haskell.compiler.${name};
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghc weeder ]; };
}
