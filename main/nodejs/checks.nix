{ nixpkgs, packages }:
let
  inherit (nixpkgs.stable) writeText runCommand;
  inherit (nixpkgs.stable.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.stable.testers) testEqualContents;

  versionCheck = version: nodejs: testEqualContents {
    assertion = "nodejs is version ${version}";
    expected = writeText "expected" ("v" + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ nodejs ]; } "node --version > $out";
  };
in
{
  nodejs-version-16-20-0 = versionCheck "16.20.0" packages.nodejs-16-20-0;
  nodejs-version-16-20-1 = versionCheck "16.20.1" packages.nodejs-16-20-1;
  nodejs-version-16-20-2 = versionCheck "16.20.2" packages.nodejs-16-20-2;
}
