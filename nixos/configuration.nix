{ pkgs, username, hostname, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    #./greeter.nix
    ./gnome.nix
    #./hyprland.nix
    # ./laptop.nix
    ./locale.nix
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = [username];
    };
  };

  # virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    podman.enable = true;
    podman.dockerCompat = true;
    podman.defaultNetwork.settings.dns_enabled = true;
    libvirtd.enable = true;
  };

  # dconf
  programs.dconf.enable = true;

  programs.java.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    podman-compose
    home-manager
    neovim
    git
    wget
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    JAVA_HOME = "${pkgs.jdk}";
  };

  
  #steam
  programs.steam = {
    enable = true;
    platformOptimizations.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.gamemode.enable = true;

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [ "amdgpu" ];
    };
    flatpak.enable = true;
    tailscale.enable = true;
    tailscale.useRoutingFeatures = "client";
    syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/Documents";
      configDir = "/home/${username}/.config/syncthing";
    };
  };

  # gpu drivers
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # firewall
  networking.firewall = rec {
    allowedTCPPorts = [ 42420 22000 21027 ];
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # user
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
    ];
  };

  # network
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # bootloader
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = rec {
      enable = true;
      # black_hud circle_hud cross_hud square_hud
      # circuit connect cuts_alt seal_2 seal_3
      theme = "connect";
      themePackages = with pkgs; [(
        adi1090x-plymouth-themes.override {
          selected_themes = [ theme ];
        }
      )];
    };
  };

  system.stateVersion = "23.05";
}
