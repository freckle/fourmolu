{ inputs, system, ... }:
let
  inherit
    (import inputs.nixpkgs-stable {
      inherit system;
      config = { };
    })
    symlinkJoin
    runCommand
    ;
in
rec {
  nodejs-16-x = nodejs-16-20-x;
  nodejs-16-20-x = nodejs-16-20-2;

  nodejs-16-20-0 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-05-06 {
        inherit system;
        config = { };
      };
      nodejs = nixpkgs.nodejs_16;
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
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );

  nodejs-16-20-1 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-07-18 {
        inherit system;
        config = {
          permittedInsecurePackages = [ "nodejs-16.20.1" ];
        };
      };
      nodejs = nixpkgs.nodejs_16;
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
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );

  nodejs-16-20-2 = (
    let
      nixpkgs = import inputs.nixpkgs-23-05 {
        inherit system;
        config = {
          permittedInsecurePackages = [ "nodejs-16.20.2" ];
        };
      };
      nodejs = nixpkgs.nodejs_16;
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
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );
}
