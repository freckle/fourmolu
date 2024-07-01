{ inputs, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable {
    inherit system;
    config = { };
  };
  configurations = import ./configurations.nix { inherit inputs system; };
  applyDefaultVersions = import ./default-versions-function.nix;
  configurationToPackage = f:
    f {
      packageSelection = _: [ ];
      enableHLS = false;
    };
in applyDefaultVersions
(nixpkgs.lib.attrsets.mapAttrs (_: configurationToPackage) configurations)
