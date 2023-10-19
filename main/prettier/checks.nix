{ nixpkgs, packages }:
let
  inherit (nixpkgs.stable) writeText runCommand;
  inherit (nixpkgs.stable.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.stable.testers) testEqualContents;

  versionCheck = version: package: testEqualContents {
    assertion = "prettier is version ${version}";
    expected = writeText "expected" (version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
      prettier --version > $out
    '';
  };
in
{
  prettier-2-8-8 = versionCheck "2.8.8" packages.prettier-2-8-8;
}
