{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnumake
    go_1_23
    gotools
    go-tools
  ];
}
