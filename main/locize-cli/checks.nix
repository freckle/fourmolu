{
  inputs,
  system,
  packages,
  ...
}:
let
  nixpkgs = import inputs.nixpkgs-stable {
    inherit system;
    config = { };
  };
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck =
    version: package:
    testEqualContents {
      assertion = "locize-cli is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        locize --version > $out
      '';
    };
in
{
  locize-cli-8-0-1 = versionCheck "8.0.1" packages.locize-cli-8-0-1;
}
