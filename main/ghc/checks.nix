{ inputs, system, packages, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  ghcVersionCheck = version: package: testEqualContents {
    assertion = "ghc is version ${version}";
    expected = writeText "expected" ("The Glorious Glasgow Haskell Compilation System, version " + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
      ghc --version > $out
    '';
  };

  weederVersionCheck = version: package: testEqualContents {
    assertion = "ghc is version ${version}";
    expected = writeText "expected" ("weeder version " + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
      weeder --version | head -n1 > $out
    '';
  };
in
{
  ghc-9-2-7 = ghcVersionCheck "9.2.7" packages.ghc-9-2-7;
  ghc-9-2-8 = ghcVersionCheck "9.2.8" packages.ghc-9-2-8;
  ghc-9-4-6 = ghcVersionCheck "9.4.6" packages.ghc-9-4-6;
  ghc-9-4-7 = ghcVersionCheck "9.4.7" packages.ghc-9-4-7;
  ghc-9-4-8 = ghcVersionCheck "9.4.8" packages.ghc-9-4-8;
  ghc-9-6-3 = ghcVersionCheck "9.6.3" packages.ghc-9-6-3;

  weeder-for-ghc-9-2-7 = weederVersionCheck "2.4.1" packages.ghc-9-2-7;
  weeder-for-ghc-9-2-8 = weederVersionCheck "2.4.1" packages.ghc-9-2-8;
  weeder-for-ghc-9-4-6 = weederVersionCheck "2.5.0" packages.ghc-9-4-6;
  weeder-for-ghc-9-4-7 = weederVersionCheck "2.7.0" packages.ghc-9-4-7;
  weeder-for-ghc-9-6-3 = weederVersionCheck "2.7.0" packages.ghc-9-6-3;
}
