{ inputs, system, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
in
rec {
  aws-cli-default = aws-cli-2-x;
  aws-cli-2-x = aws-cli-2-11-x;
  aws-cli-2-11-x = aws-cli-2-11-20;
  aws-cli-2-11-20 = nixpkgs.awscli2;
}
