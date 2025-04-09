{ pkgs, inputs, ... }: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [ "cowsay" ];
    casks = [
      "wezterm"
      "steam"
      "font-hack-nerd-font"
      "font-iosevka"
    ];
  };

  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
