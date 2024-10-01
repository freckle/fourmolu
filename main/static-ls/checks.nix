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
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck =
    version: package:
    testEqualContents {
      assertion = "static-ls is version ${version}";
      expected = writeText "expected" ("static-ls, version " + version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        static-ls --version > $out
      '';
    };
in
{
  static-ls-1-0-0 = versionCheck "1.0.0" packages.static-ls-1-0-0;
}
