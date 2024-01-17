{ inputs, system, ... }:
rec {
  cypress-default = cypress-13-x;
  cypress-13-x = cypress-13-2-x;
  cypress-13-2-x = cypress-13-2-0;
  cypress-13-2-0 =
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
    in
    nixpkgs.cypress.overrideAttrs (oldAttrs: rec {
      pname = "cypress";
      version = "13.2.0";

      src = nixpkgs.fetchzip {
        url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
        sha256 = "147wgfdfflxsrl30ckwrwsd93q67yj8afv1p5n8dbgi8arj3d3d5";
      };
    });
}
