{ mkDerivation, aeson, ansi-terminal, array, base, binary
, bytestring, Cabal-syntax, choice, containers, deepseq, Diff
, directory, file-embed, filepath, ghc-lib-parser, hspec
, hspec-discover, hspec-megaparsec, lib, megaparsec, MemoTrie, mtl
, optparse-applicative, path, path-io, pretty, process, QuickCheck
, scientific, syb, temporary, terminal-size, text, th-env, yaml
}:
mkDerivation {
  pname = "fourmolu";
  version = "0.17.0.0";
  sha256 = "1a3a8c39de4f489ab045c6e0094b633c8d35552efe220f2424350697c58defd9";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal array base binary bytestring Cabal-syntax
    choice containers deepseq Diff directory file-embed filepath
    ghc-lib-parser megaparsec MemoTrie mtl scientific syb text
  ];
  executableHaskellDepends = [
    base Cabal-syntax containers directory filepath ghc-lib-parser
    optparse-applicative terminal-size text th-env yaml
  ];
  testHaskellDepends = [
    base bytestring Cabal-syntax choice containers Diff directory
    filepath ghc-lib-parser hspec hspec-megaparsec megaparsec path
    path-io pretty process QuickCheck temporary text yaml
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/fourmolu/fourmolu";
  description = "A formatter for Haskell source code";
  license = lib.licenses.bsd3;
  mainProgram = "fourmolu";
}
