{ nixpkgs }:
nixpkgs.writeShellApplication {
  name = "stack";
  text = ''
    ${nixpkgs.stack}/bin/stack --system-ghc --no-install-ghc --no-nix "$@"
  '';
}
