{ pkgs, system, ... }:

let
  customAlacritty = import ./config/alacritty/alacritty.nix;
  customFonts = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; };
  customLsd = import ./config/lsd/lsd.nix;
  customZsh = import ./config/zsh/zsh.nix;
  customNvim = import ./config/nvim/nvim.nix;
  customSonarLint = import ../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
in
{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    neovim = customNvim pkgs;
    alacritty = customAlacritty { inherit system; };
    lsd = customLsd;
    zsh = customZsh;
  };

  home.packages = with pkgs; [
    customFonts
    fzf
    ripgrep
    tmux
    customSonarLint
  ];

  home.file = {
    ".config/tmux".source = ../dotfiles/tmux;
    ".config/zsh/themes".source = ./config/zsh/themes;
    ".config/zsh/plugins".source = ./config/zsh/plugins;
  };
}
