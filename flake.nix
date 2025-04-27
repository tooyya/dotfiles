# flake.nix
{
  description = "multi platform dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      neovim-nightly-overlay,
      flake-utils,
      ...
    }:
    let
      # ここを変えれば attr 名が一括で変わる
      prefix = "tooyya";
      systems = flake-utils.lib.defaultSystems;

      # 共通 pkgs
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ neovim-nightly-overlay.overlays.default ];
          config = {
            allowUnfree = true;
          };
        };

      # Home‑Manager
      mkHM =
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs system;
          modules = [ ./home/default.nix ]; # nix/home-manager から home に変更
          extraSpecialArgs = { inherit inputs; };
        };

      # attrset を生成
      homeConfs = builtins.listToAttrs (
        map (system: {
          name = "${prefix}-${system}";
          value = mkHM system;
        }) systems
      );
    in
    # ─── per‑system outputs ───
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = mkPkgs system;
        keyName = "${prefix}-${system}";
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        apps.update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update" ''
                        set -euo pipefail

              	  export NIX_PATH=""

                        echo "› nix flake update"
                        nix flake update

                        echo "› home-manager switch"
                        ${home-manager.packages.${system}.home-manager}/bin/home-manager \
                          --impure switch --flake .#"${keyName}"

                        echo "✓ All done!"
            ''
          );

          meta = {
            description = "Update flake, Home‑Manager";
          };
        };
      }
    )
    # ─── top‑level attrsets ───
    // {
      homeConfigurations = homeConfs;
    };
}
