{
  description = "Home Manager and NixOS configuration of Aylur";

  outputs = { home-manager, nixpkgs, ... }@inputs: let
    username = "hlofiys";
    hostname = "sisyphus";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    #asztal = pkgs.callPackage ./ags { inherit inputs; };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs username hostname; };
      modules = [ ./nixos/configuration.nix ];
    };

   /* homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs username asztal; };
      modules = [ ./home-manager/home.nix ];
      };  

    packages.${system}.default = asztal;
  */
  };
  
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
      # "https://nixpkgs-wayland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      # "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  }; 

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    #matugen.url = "github:InioX/matugen";
    #ags.url = "github:Aylur/ags";
    #astal.url = "github:Aylur/astal";
    #stm.url = "github:Aylur/stm";

    #lf-icons = {
    #  url = "github:gokcehan/lf";
    #  flake = false;
    #};
    #firefox-gnome-theme = {
    #  url = "github:rafaelmardojai/firefox-gnome-theme";
    #  flake = false;
    #};
  };
}
