{ inputs, system, ... }:
rec {
  aws-cli-default = aws-cli-2-x;
  aws-cli-2-x = aws-cli-2-15-x;

  aws-cli-2-11-x = aws-cli-2-11-20;
  aws-cli-2-11-20 = inputs.nixpkgs-23-05.legacyPackages.${system}.awscli2;

  aws-cli-2-13-x = aws-cli-2-13-33;
  aws-cli-2-13-33 = inputs.nixpkgs-23-11.legacyPackages.${system}.awscli2;

  aws-cli-2-15-x = aws-cli-2-15-43;
  aws-cli-2-15-43 = inputs.nixpkgs-stable.legacyPackages.${system}.awscli2;
}
