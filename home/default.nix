# home/default.nix
{ pkgs, ... }:
let
  envUser =
    let
      u = builtins.getEnv "USER";
    in
    if u != "" then u else "unknown";
  envHome =
    let
      h = builtins.getEnv "HOME";
    in
    if h != "" then h else "/home/${envUser}";
in
{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = envUser;
    homeDirectory = envHome;

    stateVersion = "24.11";

    packages = with pkgs; [
      git
      curl
      nixfmt-rfc-style
      nil
    ];
  };

  imports = [
    ./modules/git
    ./modules/nvim
    ./modules/zsh
  ];

  programs = {
    home-manager.enable = true;
  };
}
