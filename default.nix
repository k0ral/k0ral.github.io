{ nixpkgs ? import <nixpkgs> { } }:

let
  dependencies = with nixpkgs; [ nodePackages.tiddlywiki ];
  shell = nixpkgs.mkShell { buildInputs = dependencies; };
  build = nixpkgs.stdenv.mkDerivation {
    name = "k0ral.github.io";
    src = ./.;
    buildInputs = dependencies;
    buildPhase = ''
      ${nixpkgs.nodePackages.tiddlywiki}/bin/tiddlywiki . --output . --build index
    '';
    installPhase = ''
      mkdir -p $out
      cp $src/index.html $out/
    '';
  };

in {
  inherit shell;
  inherit build;
}
