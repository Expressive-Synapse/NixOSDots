# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix
      ./hardware/disko.nix

      ./netsec/firewall.nix
      ./netsec/syncthing.nix
      ./netsec/sambamount.nix
      ./netsec/wireguard.nix
      ./netsec/clamAV.nix

      ./system/wayland.nix
      ./system/pipewire.nix
      ./system/dbus.nix
      ./system/gnome-keyring.nix

      ./wm/hyprland.nix

      ./deviceInterfacing.nix
      ./virtualbox.nix
      ./gaming.nix
      ./vesktop.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
#  boot.loader.efi.efiSysMountPoint = "/boot";
#  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";

###################################################
#                    FileSystem                   #
###################################################
boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/mapper/main /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

fileSystems."/persist".neededForBoot = true;
environment.persistence."/persist/system" = {
  hideMounts = true;
  directories = [
    "/etc/nixos"
  ];
};
###################################################
#                     Network                     #
###################################################
  networking.hostName = "Titanic"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

###################################################
#                    Security                     #
###################################################

security.polkit.enable = true;

###################################################
#                    Location                     #
###################################################
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
###################################################
#                     Users                       #
###################################################

/*---------------expressive-synapse--------------*/

sops.age.keyFile = "/persist/Keys/sops-key.txt";
sops.secrets."users/expressive-synapse/accountpass" = {
  neededForUsers = true;

};

users.users.expressive-synapse = {
  isNormalUser = true;
  hashedPasswordFile = config.sops.secrets."users/expressive-synapse/accountpass".path;
  uid = 1000;
  description = "Connor Goff";
  extraGroups = [ "networkmanager" "wheel" ];
};
programs.fuse.userAllowOther = true;
home-manager.extraSpecialArgs = {
  inherit inputs;
  inherit pkgs;
};
home-manager.users.expressive-synapse = {
  imports = [ 
    inputs.impermanence.nixosModules.home-manager.impermanence
    ../../users/expressive-synapse/general/home.nix
    ../../users/expressive-synapse/Titanic/home.nix
  ];
};

###################################################
#                    Packages                     #
###################################################
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    sops
    wl-clipboard
    nix-index
  ];

###################################################
#                   Keymapping                    #
###################################################
# Configure keymap in X11
services.xserver = {
  xkb.layout = "us";
  xkb.variant = "";
};
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

###################################################
#                      SOPS                       #
###################################################
sops.defaultSopsFile = ../../secrets/secrets.yaml;
sops.defaultSopsFormat = "yaml";

###################################################
#                     NixOS                       #
###################################################

nix.settings = {
  substituters = ["https://hyprland.cachix.org"];
  trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
};
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.11"; # Did you read the comment?

nix.settings.experimental-features = ["nix-command" "flakes"];
}
