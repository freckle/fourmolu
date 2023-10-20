{ inputs, system, ... }:
rec {
  haskell-openapi3-code-generator-default =
    inputs.haskell-openapi3-code-generator.packages.${system}.default;
}
