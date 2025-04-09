{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.btop
    pkgs.gh
    pkgs.tree
    pkgs.wget
    pkgs.fastfetch
    pkgs.neovim
    pkgs.go
    pkgs.ripgrep
    pkgs.fzf
  ];
}
