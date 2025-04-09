{
  description = "My multi-platform Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... } @ inputs: # Capture all inputs
  let
    # Define common modules list - these are PATHS or module VALUES
    commonModules = [
      ./common/packages.nix
      ./common/users.nix
      # ./home-manager/home.nix # This should be imported via home-manager config, not directly here
    ];

  in {
    # --- Darwin Configuration ---
    darwinConfigurations."monke-mac" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      # Special arguments passed to all modules
      specialArgs = { inherit inputs; }; # Pass flake inputs if modules need them

      # Modules are imported automatically by the system builders
      # Just provide the paths or module definitions directly.
      # The system builder passes { pkgs, config, lib, options, specialArgs, ... } to each module.
      modules = [
        # System-specific configuration
        ./darwin/configuration.nix

        # Common modules
      ] ++ commonModules ++ [
        # Home Manager module for darwin
        home-manager.darwinModules.home-manager

        # Home Manager configuration for this specific system
        {
          # Use pkgs defined by darwinSystem for HM evaluation
          home-manager.useGlobalPkgs = true;
          # Users packages are installed to the user profile
          home-manager.useUserPackages = true;

          # Define users managed by Home Manager
          home-manager.users.mack = {
            # Import the user-specific home-manager configuration
            # This file should contain HM options like home.packages, programs.*, etc.
            imports = [ ./home-manager/mack-home.nix ]; # Renamed for clarity
          };

          # Optional: Set home-manager's nixpkgs explicitly if needed,
          # but useGlobalPkgs=true usually handles this.
          # home-manager.backupFileExtension = "hm-bak"; # Example HM option
        }
      ];
      # NO NEED TO SET `pkgs` HERE - darwinSystem derives it from `system` and `nixpkgs` input
    };

    # --- NixOS Configuration ---
    nixosConfigurations."nixos-machine" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Adjust as needed
      # Special arguments passed to all modules
      specialArgs = { inherit inputs; }; # Pass flake inputs if modules need them

      # Modules are imported automatically by the system builders
      modules = [
        # System-specific configuration
        ./nixos/configuration.nix

        # Common modules
      ] ++ commonModules ++ [
        # Home Manager module for NixOS
        home-manager.nixosModules.home-manager

        # Home Manager configuration for this specific system
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.mack = {
            imports = [ ./home-manager/mack-home.nix ]; # Use the same home config
          };
          # home-manager.backupFileExtension = "hm-bak"; # Example HM option
        }
      ];
      # NO NEED TO SET `pkgs` HERE - nixosSystem derives it from `system` and `nixpkgs` input
      # ESPECIALLY DO NOT set it to aarch64-darwin pkgs!
    };
  };
}
