{ pkgs ? import <nixpkgs> {} }:
let
  easy-ps = import ./dep/easy-purescript-nix { inherit pkgs; };
in 
  pkgs.mkShell {
    buildInputs = [
      easy-ps.purs-0_14_0
      easy-ps.psc-package
      easy-ps.spago
      easy-ps.pscid
      # `npm install` builds PS using its stack.yml which is on lts-13.26 (ghc 8.6.5)
      pkgs.stack
      pkgs.haskell.compiler.ghc865
    ];
  }

