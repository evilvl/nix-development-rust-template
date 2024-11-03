{
  description = "Rust development environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      currentSystem = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${currentSystem};
    in
    {
      devShell.${currentSystem} = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixd
          nixfmt-rfc-style
          rustc
          cargo
          rustfmt
          clippy
          cargo-watch
        ];
      };
    };
}
