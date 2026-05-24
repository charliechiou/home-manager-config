{ config, pkgs, ... }:

{
  home.username = "chiu";
  home.homeDirectory = "/home/chiu";

  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    # Basic
    pkgs.curl
    pkgs.gnumake
    pkgs.cmake
    pkgs.gcc
    pkgs.gdb
    pkgs.git
    pkgs.htop
    pkgs.nvtopPackages.full
    pkgs.bc
    pkgs.tig

    # Mail
    pkgs.neomutt
    pkgs.public-inbox

    # Developmenta
    pkgs.neovim
    pkgs.ripgrep
    pkgs.fd
    pkgs.tmux
    pkgs.fastfetch
    pkgs.bat
    pkgs.nodejs

    # Application
    pkgs.uxplay

    # Blog
    pkgs.hugo

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

programs.starship = {
    enable = true;
    enableZshIntegration = true;
    
    settings = {
      add_newline = false;

      format = "$username$hostname$directory$git_branch$git_status$nix_shell$character";

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };

      git_status = {

        untracked = "?\${count}";   
        modified = "!\${count}";
        staged = "+\${count}";   

        ahead = "⇡\${count}";       
        behind = "⇣\${count}";      
        conflicted = "=\${count}";  
        deleted = "-\${count}";     
        renamed = "»\${count}";     
        stashed = "$\${count}";     

        format = "([\\[$branch ]($style)[$all_status$ahead_behind\\]]($style) )";
        style = "green bold"; 
      };
      
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        style = "bold blue";
      };
    };
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

    '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
