{ inputs, system, ... }: rec {
  cypress-default = cypress-13-x;

  cypress-13-x = cypress-13-6-x;

  cypress-13-2-x = cypress-13-2-0;
  cypress-13-2-0 = let
    nixpkgs = import inputs.nixpkgs-stable {
      inherit system;
      config = { };
    };
  in nixpkgs.cypress.overrideAttrs (oldAttrs: rec {
    pname = "cypress";
    version = "13.2.0";

    src = nixpkgs.fetchzip {
      url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
      sha256 = "147wgfdfflxsrl30ckwrwsd93q67yj8afv1p5n8dbgi8arj3d3d5";
    };
  });

  cypress-13-6-x = cypress-13-6-4;
  cypress-13-6-4 = let
    nixpkgs = import inputs.nixpkgs-stable {
      inherit system;
      config = { };
    };
  in nixpkgs.cypress.overrideAttrs (oldAttrs: rec {
    pname = "cypress";
    version = "13.6.4";

    src = nixpkgs.fetchzip {
      url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
      sha256 = "0hafpd98y9ji9kw6rsbb7ss482c306y2mfb9x4yvf7nhlk4blnw0";
    };
  });
}
