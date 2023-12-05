{ inputs, packages, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

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

  checkPnpmVersion = version: package: testEqualContents {
    assertion = "pnpm is version ${version}";
    expected = writeText "expected" (version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ package ]; } "pnpm --version > $out";
  };

in
{
  nodejs-16-20-0-version = checkNodejsVersion "16.20.0" packages.nodejs-16-20-0;
  nodejs-16-20-1-version = checkNodejsVersion "16.20.1" packages.nodejs-16-20-1;
  nodejs-16-20-2-version = checkNodejsVersion "16.20.2" packages.nodejs-16-20-2;
  nodejs-18-17-1-version = checkNodejsVersion "18.17.1" packages.nodejs-18-17-1;
  nodejs-18-18-0-version = checkNodejsVersion "18.18.0" packages.nodejs-18-18-0;

  nodejs-16-20-0-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-0;
  nodejs-16-20-1-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-1;
  nodejs-16-20-2-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-16-20-2;
  nodejs-18-17-1-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-18-17-1;
  nodejs-18-18-0-yarn-version = checkYarnVersion "1.22.19" packages.nodejs-18-18-0;

  nodejs-16-20-0-pnpm-version = checkPnpmVersion "8.4.0" packages.nodejs-16-20-0;
  nodejs-16-20-1-pnpm-version = checkPnpmVersion "8.5.1" packages.nodejs-16-20-1;
  nodejs-16-20-2-pnpm-version = checkPnpmVersion "8.5.1" packages.nodejs-16-20-2;
  nodejs-18-17-1-pnpm-version = checkPnpmVersion "8.6.12" packages.nodejs-18-17-1;
  nodejs-18-18-0-pnpm-version = checkPnpmVersion "8.8.0" packages.nodejs-18-18-0;
}
