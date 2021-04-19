{ nixpkgs ? import <nixpkgs> { } }:

let
  dependencies = with nixpkgs; [ nodePackages.tiddlywiki ];
  shell = nixpkgs.mkShell { buildInputs = dependencies; };
  build = nixpkgs.stdenv.mkDerivation {
    name = "k0ral.github.io";
    src = ./.;
    buildInputs = dependencies;
    buildPhase = ''
      mkdir -p $out
      ${nixpkgs.nodePackages.tiddlywiki}/bin/tiddlywiki . --output $out --build index
    '';
    installPhase = "true";
  };

in {
  inherit shell;
  inherit build;
}
