{ nixpkgs }:
rec {
  aws-cli-default = aws-cli-2-x;
  aws-cli-2-x = aws-cli-2-11-x;
  aws-cli-2-11-x = aws-cli-2-11-20;
  aws-cli-2-11-20 = nixpkgs.stable.awscli2;
}
