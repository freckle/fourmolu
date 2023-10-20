{ inputs, system, packages, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck = version: package: testEqualContents {
    assertion = "aws-cli is version ${version}";
    expected = writeText "expected" ("aws-cli/" + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
      aws --version \
        | sed -re 's#^(aws-cli/[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+) .*$#\1#' \
        > $out
    '';
  };
in
{
  aws-cli-2-11-20 = versionCheck "2.11.20" packages.aws-cli-2-11-20;
}
