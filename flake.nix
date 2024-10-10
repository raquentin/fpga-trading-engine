{
    description = "punt-engine monorepo";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
        in {
            devShells.default = pkgs.mkShell {
                    buildInputs = with pkgs; [
                haskell.compiler.ghc98
                cabal-install
                hlint
                haskell-language-server
                nixpkgs-fmt
                git

            ];

            shellHook = ''
                echo "Welcome to the punt-engine dev env."
            '';
                };
            });
}
