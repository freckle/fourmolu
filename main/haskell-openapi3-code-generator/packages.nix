{ inputs, system, ... }:
rec {
  haskell-openapi3-code-generator-default =
    inputs.haskell-openapi-code-generator.packages.${system}.default;
}
