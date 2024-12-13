{ inputs, system }:
let
  nixpkgs = inputs.nixpkgs-stable.legacyPackages.${system};
  inherit (nixpkgs)
    fetchFromGitHub
    mkYarnPackage
    fetchYarnDeps
    nodejs
    makeWrapper
    ;
in
{
  locize-cli-8-0-1 = mkYarnPackage rec {
    pname = "locize-cli";
    version = "8.0.1";
    src = fetchFromGitHub {
      owner = "locize";
      repo = "locize-cli";
      rev = "v8.0.1";
      hash = "sha256-yosx7bCH6ewlGz5Uz7VxcCu2zEiFxFhq/e6OIDGk27k=";
    };
    packageJSON = "${src}/package.json";
    yarnLock = ./yarn.lock;
    offlineCache = fetchYarnDeps {
      yarnLock = ./yarn.lock;
      hash = "sha256-R+QWAIphbCLNKcMH9XMF74JQmRdzxIYeeVqH6xlF6T4=";
    };
    yarnNix = ./yarn.nix;
    nativeBuildInputs = [ makeWrapper ];
  };
}
