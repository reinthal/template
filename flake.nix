{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Basics
            git
            gh
            ninja
            # Python
            uv
            ruff
            # Typesetting
            typst
            texlive.combined.scheme-medium
            # Nix
            nil
            nixfmt-rfc-style
            # JavaScript
            nodejs # remote-mcp
          ];
        };
      }
    );
}
