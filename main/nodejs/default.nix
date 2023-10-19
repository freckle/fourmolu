{ nixpkgs }:
let
  inherit (nixpkgs.stable) symlinkJoin;
in

rec {
  nodejs-default = nodejs-16-x;
  nodejs-16-x = nodejs-16-20-x;
  nodejs-16-20-x = nodejs-16-20-2;

  nodejs-16-20-0 = (
    let
      pkgs = nixpkgs.master-2023-05-06;
      nodejs = pkgs.nodejs_16;
      yarn = pkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );

  nodejs-16-20-1 = (
    let
      pkgs = nixpkgs.master-2023-07-18;
      nodejs = pkgs.nodejs_16;
      yarn = pkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );

  nodejs-16-20-2 = (
    let
      pkgs = nixpkgs.stable;
      nodejs = pkgs.nodejs_16;
      yarn = pkgs.yarn.override { inherit nodejs; };
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs yarn ];
    }
  );
}
