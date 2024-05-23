{ inputs, system, packages, lib, ... }:
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

  hlsVersionCheck = version: package: testEqualContents {
    assertion = "haskell-language-server is version ${version}";
    expected = writeText "expected" ("haskell-language-server version: " + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
      haskell-language-server-wrapper --version | head -n1 \
        | sed -re 's#^(haskell-language-server version: [[:digit:]\.]+).*$#\1#' \
        > $out
    '';
  };
in
{
  ghc-9-2-7 = ghcVersionCheck "9.2.7" packages.ghc-9-2-7;
  ghc-9-2-8 = ghcVersionCheck "9.2.8" packages.ghc-9-2-8;
  ghc-9-4-5 = ghcVersionCheck "9.4.5" packages.ghc-9-4-5;
  ghc-9-4-6 = ghcVersionCheck "9.4.6" packages.ghc-9-4-6;
  ghc-9-4-7 = ghcVersionCheck "9.4.7" packages.ghc-9-4-7;
  ghc-9-4-8 = ghcVersionCheck "9.4.8" packages.ghc-9-4-8;
  ghc-9-6-3 = ghcVersionCheck "9.6.3" packages.ghc-9-6-3;
  ghc-9-6-4 = ghcVersionCheck "9.6.4" packages.ghc-9-6-4;
  ghc-9-6-5 = ghcVersionCheck "9.6.5" packages.ghc-9-6-5;

  weeder-for-ghc-9-2-7 = weederVersionCheck "2.4.1" packages.ghc-9-2-7;
  weeder-for-ghc-9-2-8 = weederVersionCheck "2.4.1" packages.ghc-9-2-8;
  weeder-for-ghc-9-4-5 = weederVersionCheck "2.7.0" packages.ghc-9-4-5;
  weeder-for-ghc-9-4-6 = weederVersionCheck "2.7.0" packages.ghc-9-4-6;
  weeder-for-ghc-9-4-7 = weederVersionCheck "2.7.0" packages.ghc-9-4-7;
  weeder-for-ghc-9-4-8 = weederVersionCheck "2.7.0" packages.ghc-9-4-8;
  weeder-for-ghc-9-6-3 = weederVersionCheck "2.7.0" packages.ghc-9-6-3;
  weeder-for-ghc-9-6-4 = weederVersionCheck "2.8.0" packages.ghc-9-6-4;
  weeder-for-ghc-9-6-5 = weederVersionCheck "2.8.0" packages.ghc-9-6-5;

  hls-for-ghc-9-2-7 = hlsVersionCheck "1.10.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-2-7"; enableHLS = true; });
  hls-for-ghc-9-2-8 = hlsVersionCheck "2.2.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-2-8"; enableHLS = true; });
  hls-for-ghc-9-4-5 = hlsVersionCheck "2.4.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-4-5"; enableHLS = true; });
  hls-for-ghc-9-4-6 = hlsVersionCheck "2.4.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-4-6"; enableHLS = true; });
  hls-for-ghc-9-4-7 = hlsVersionCheck "2.4.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-4-7"; enableHLS = true; });
  hls-for-ghc-9-4-8 = hlsVersionCheck "2.4.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-4-8"; enableHLS = true; });
  hls-for-ghc-9-6-3 = hlsVersionCheck "2.4.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-6-3"; enableHLS = true; });
  hls-for-ghc-9-6-4 = hlsVersionCheck "2.7.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-6-4"; enableHLS = true; });
  hls-for-ghc-9-6-5 = hlsVersionCheck "2.7.0.0" (lib.haskellBundle { ghcVersion = "ghc-9-6-5"; enableHLS = true; });
}
