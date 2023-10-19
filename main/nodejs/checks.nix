{ nixpkgs, packages }:
let
  inherit (nixpkgs.stable) writeText runCommand;
  inherit (nixpkgs.stable.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.stable.testers) testEqualContents;

  checkNodejsVersion = version: package: testEqualContents {
    assertion = "nodejs is version ${version}";
    expected = writeText "expected" ("v" + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } "node --version > $out";
  };

  checkYarnVersion = version: package: testEqualContents {
    assertion = "yarn is version ${version}";
    expected = writeText "expected" (version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } "yarn --version > $out";
  };
in
{
  nodejs-16-20-0-version = checkNodejsVersion "16.20.0" packages.nodejs-16-20-0;
  nodejs-16-20-1-version = checkNodejsVersion "16.20.1" packages.nodejs-16-20-1;
  nodejs-16-20-2-version = checkNodejsVersion "16.20.2" packages.nodejs-16-20-2;

  nodejs-16-20-0-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-0;
  nodejs-16-20-1-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-1;
  nodejs-16-20-2-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-2;
}
