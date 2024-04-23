# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, flakeSettings, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix

      ./netsec/firewall.nix
      ./netsec/syncthing.nix
      ./netsec/sambamount.nix
      ./netsec/wireguard.nix

      ./system/wayland.nix
      ./system/pipewire.nix
      ./system/dbus.nix
      ./system/gnome-keyring.nix

      ./wm/hyprland.nix

      ./nix-ld.nix
    ];

services.xremap.config.modmap = [
  {
  name = "cool CapsLock";
  remap = {
    CapsLock = {
      held = "leftctrl";
      alone = "esc";
      alone_timeout_millis = 150;
    };
  };
  }
];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-33a2bcd5-4e13-4fd4-82c9-867f7f411a6f".device = "/dev/disk/by-uuid/33a2bcd5-4e13-4fd4-82c9-867f7f411a6f";

  networking.hostName = "Titanic"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/expressive-synapse/Documents/Keys/sops-key.txt";
  sops.secrets."users/expressive-synapse/accountpass" = { };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.expressive-synapse = {
    isNormalUser = true;
    initialPassword = config.sops.secrets."users/expressive-synapse/accountpass".path;
    uid = 1000;
    description = "Connor Goff";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit flakeSettings;
    inherit config;
    inherit pkgs;
  };
  home-manager.users.expressive-synapse = import ../../users/expressive-synapse/home.nix;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    sops
    wl-clipboard
    nix-index
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
