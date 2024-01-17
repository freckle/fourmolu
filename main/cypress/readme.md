When adding a new cypress version, obtain the sha256 hash for it like so:

    nix-prefetch-url --unpack https://cdn.cypress.io/desktop/<version>/linux-x64/cypress.zip

To use cypress in a dev shell, add the following argument to the `mkShell` function:

    shellHook = ''
      export CYPRESS_INSTALL_BINARY=0
      export CYPRESS_RUN_BINARY=${cypress}/bin/Cypress
    '';
