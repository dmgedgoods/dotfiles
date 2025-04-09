{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.btop
    pkgs.gh
    pkgs.tmux
    pkgs.tree
    pkgs.wget
    pkgs.fastfetch
    pkgs.neovim
    pkgs.go
    pkgs.ripgrep
    pkgs.fzf
    pkgs.python3#.withPackages (python-pkgs: [
		#python-pkgs.pandas
		#python-pkgs.requests
		#])

  ];
}
