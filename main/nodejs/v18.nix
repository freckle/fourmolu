{ inputs, system, ... }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin runCommand;
in
rec {
  # 18.18.0 is not recommended due to https://github.com/webpack-contrib/thread-loader/issues/191
  nodejs-18-x = nodejs-18-17-x;

  nodejs-18-17-x = nodejs-18-17-1;
  nodejs-18-18-x = nodejs-18-18-0;

  nodejs-18-17-1 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-09-15 { inherit system; config = { }; };
      nodejs = nixpkgs.nodejs_18;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs pnpm pnpm-bin yarn ];
    }
  );

  nodejs-18-18-0 = (
    let
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 { inherit system; config = { }; };
      nodejs = nixpkgs.nodejs_18;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [ nodejs pnpm pnpm-bin yarn ];
    }
  );
}
