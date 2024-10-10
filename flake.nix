{
    description = "punt-engine monorepo";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        haskellNix.url = "github:input-output-hk/haskell.nix";
    };

    outputs = { self, nixpkgs, flake-utils, haskellNix }:
        flake-utils.lib.eachDefaultSystem (system:
        let
            overlays = [ haskellNix.overlay
                (final: prev: {
                    fixParser = 
                        final.haskell-nix.project' {
                            src = ./fix-parser/.;
                            compiler-nix-name = "ghc966";
                            shell.tools = {
                                cabal = {};
                                hlint = {};
                                haskell-language-server = {};
                            };
                            shell.buildInputs = with pkgs; [
                                nixpkgs-fmt
                            ];
                        };
                })
            ];
            pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; };
            flake = pkgs.fixParser.flake { };
        in flake // {
            packages.default = flake.packages."fixParser:exe:fixParser";
        });
}
