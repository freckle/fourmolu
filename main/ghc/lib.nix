{ inputs, system, ... }:
let
  configurations = import ./configurations.nix { inherit inputs system; };
  applyDefaultVersions = import ./default-versions-function.nix;
in

{
  haskellBundle =
    { ghcVersion ? "ghc-default"
    , packageSelection ? _: [ ]
    , enableHLS ? false # Haskell Language Server is optional because it is large
    }:
    (applyDefaultVersions configurations).${ghcVersion} {
      inherit packageSelection enableHLS;
    };
}
