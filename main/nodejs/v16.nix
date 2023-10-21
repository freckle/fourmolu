{ inputs, system, ... }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin;
in
rec {
  nodejs-16-x = nodejs-16-20-x;
  nodejs-16-20-x = nodejs-16-20-2;

  nodejs-16-20-0 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-05-06 { inherit system; config = { }; };
      nodejs = nixpkgs.nodejs_16;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );

  nodejs-16-20-1 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-07-18 {
        inherit system; config = {
        permittedInsecurePackages = [
          "nodejs-16.20.1"
        ];
      };
      };
      nodejs = nixpkgs.nodejs_16;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );

  nodejs-16-20-2 = (
    let
      nixpkgs = import inputs.nixpkgs-stable {
        inherit system; config = {
        permittedInsecurePackages = [
          "nodejs-16.20.2"
        ];
      };
      };
      nodejs = nixpkgs.nodejs_16;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );
}
