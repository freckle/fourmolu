{ inputs, system, ... }:
let
  locize-cli-packages =
    (import ./8.0.1 { inherit inputs system; })
    //
    (with locize-cli-packages; {
      locize-cli-default = locize-cli-8-x;
      locize-cli-8-x = locize-cli-8-0-x;
      locize-cli-8-0-x = locize-cli-8-0-1;
    })
  ;
in
locize-cli-packages
