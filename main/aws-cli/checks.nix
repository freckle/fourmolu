{ nixpkgs, packages }:
let
  inherit (nixpkgs.stable) writeText runCommand;
  inherit (nixpkgs.stable.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.stable.testers) testEqualContents;

  versionCheck = version: fourmolu: testEqualContents {
    assertion = "aws-cli is version ${version}";
    expected = writeText "expected" ("aws-cli/" + version + "\n");
    actual = runCommand "actual" { nativeBuildInputs = [ fourmolu ]; } ''
      aws --version \
        | sed -re 's#^(aws-cli/[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+) .*$#\1#' \
        > $out
    '';
  };
in
{
  aws-cli-2-11-20 = versionCheck "2.11.20" packages.aws-cli-2-11-20;
}
