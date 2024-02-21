{ inputs, system, ... }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin runCommand;
in
rec {
  nodejs-20-x = nodejs-20-11-x;

  nodejs-20-11-x = nodejs-20-11-1;

  nodejs-20-11-1 = (
    let
      nixpkgs = import inputs.nixpkgs-unstable-2024-02-20 { inherit system; config = { }; };
      nodejs = nixpkgs.nodejs_20;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpx" "$out/bin/pnpx"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs pnpm pnpm-bin yarn ];
    }
  );
}
