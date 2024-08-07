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
      assertion = "stack-lint-extra-deps is version ${version}";
      expected = writeText "expected" ("stack-lint-extra-deps-" + version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        stack-lint-extra-deps --version > $out
      '';
    };
in
{
  stack-lint-extra-deps-1-2-2 = versionCheck "1.2.2.1" packages.stack-lint-extra-deps-1-2-2;
}
