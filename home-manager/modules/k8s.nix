{ pkgs, ... }:

{
  home.packages = with pkgs; [
    k9s
    kubectl
    kubectl-ktop
    kubectl-neat
    kubectl-tree
    kubernetes-helm
    skaffold
    stern
  ];
}
