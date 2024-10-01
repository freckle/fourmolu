{ inputs, system, ... }:
rec {
  static-ls-default = static-ls-1-0-0;
  static-ls-1-0-0 = inputs.static-ls.packages.${system}.static-ls;
}
