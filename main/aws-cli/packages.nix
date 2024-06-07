{ inputs, system, ... }:
rec {
  aws-cli-default = aws-cli-2-x;
  aws-cli-2-x = aws-cli-2-15-x;

  aws-cli-2-11-x = aws-cli-2-11-20;
  aws-cli-2-11-20 =
    let
      nixpkgs = import inputs.nixpkgs-23-05 { inherit system; config = { }; };
    in
    nixpkgs.awscli2;

  aws-cli-2-13-x = aws-cli-2-13-33;
  aws-cli-2-13-33 =
    let
      nixpkgs = import inputs.nixpkgs-23-11 { inherit system; config = { }; };
    in
    nixpkgs.awscli2;

  aws-cli-2-15-x = aws-cli-2-15-43;
  aws-cli-2-15-43 =
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
    in
    nixpkgs.awscli2;
}
