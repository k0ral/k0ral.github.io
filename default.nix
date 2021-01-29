{ nixpkgs ? import <nixpkgs> { } }:

let
  shell = nixpkgs.mkShell {
    buildInputs = with nixpkgs; [ nodePackages.tiddlywiki ];
  };

in { inherit shell; }
