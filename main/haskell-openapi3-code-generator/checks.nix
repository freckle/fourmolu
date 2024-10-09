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

  check =
    package:
    testEqualContents {
      assertion = "haskell-openapi3-code-generator runs";
      expected = writeText "expected" ''
        Generate Haskell code from OpenAPI 3 specifications
      '';
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        openapi3-code-generator-exe -h | head -n1 > $out
      '';
    };
in
{
  haskell-openapi3-code-generator-default = check packages.haskell-openapi3-code-generator-default;
}
