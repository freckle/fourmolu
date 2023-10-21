{ inputs, system, ... }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin;
in
rec {
  nodejs-18-x = nodejs-18-18-x;
  nodejs-18-18-x = nodejs-18-18-0;

  nodejs-18-18-0 = (
    let
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 { inherit system; config = { }; };
      nodejs = nixpkgs.nodejs_18;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );
}
