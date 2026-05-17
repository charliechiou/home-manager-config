{ config, pkgs, ... }:

{
  home.username = "chiu";
  home.homeDirectory = "/home/chiu";

  home.stateVersion = "25.11";

  home.packages = [
    # Basic
    pkgs.curl
    pkgs.cmake
    pkgs.gcc
    pkgs.gdb
    pkgs.git
    pkgs.htop

    # Development
    pkgs.neovim
    pkgs.ripgrep
    pkgs.fd
    pkgs.tmux
    pkgs.fastfetch
    pkgs.bat
    pkgs.nodejs

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".gitconfig".text = ''
      [user]
        name = Po-Ying Chiu
        email = charlie910417@gmail.com
      [core]
        editor = nvim
    '';
    ".config/nvim".source = ./dotfiles/astronvim;
  };

  programs.zsh.initContent = {
    enable = true;
    initExtra = ''
    '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
