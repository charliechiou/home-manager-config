{ config, pkgs, ... }:

{
  home.username = "chiu";
  home.homeDirectory = "/home/chiu";

  home.stateVersion = "25.11";

  home.packages = [
    # Basic
    pkgs.curl
    pkgs.gnumake
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

  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      hms = "home-manager switch";
      hmconf = "nvim ~/.config/home-manager/home.nix";
    };


    initContent = ''
      export ZSH="$HOME/.oh-my-zsh"

      plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

      source $ZSH/oh-my-zsh.sh

      source ~/powerlevel10k/powerlevel10k.zsh-theme

      [[ ! -f ~/.config/home-manager/dotfiles/zsh/p10k.zsh ]] || source ~/.config/home-manager/dotfiles/zsh/p10k.zsh
    '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
