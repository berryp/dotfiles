# The Tempest
# System configuration for my desktop
{
  inputs,
  globals,
  overlays,
  ...
}:
with inputs;
  nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
      globals
      home-manager.nixosModules.home-manager
      ../../modules/common
      ../../modules/nixos
      {
        nixpkgs.overlays = overlays;

        # Hardware
        physical = true;
        networking.hostName = "nixos";

        boot.initrd.availableKernelModules = ["virtio_pci" "xhci_pci" "usbhid" "usb_storage"];
        boot.initrd.kernelModules = [];
        boot.kernelModules = [];
        boot.extraModulePackages = [];

        fileSystems."/" = {
          device = "/dev/disk/by-label/nixos";
          fsType = "ext4";
        };

        fileSystems."/boot" = {
          device = "/dev/disk/by-label/boot";
          fsType = "vfat";
        };

        passwordHash = inputs.nixpkgs.lib.fileContents ../../misc/password.sha512;

        theme = {
          colors = (import ../../colorscheme/tokyonight-dark).dark;
          dark = true;
        };

        networking.enableIPv6 = false;
        networking.defaultGateway = {
          address = "192.168.75.1";
          interface = "enp0s2";
        };
        networking.nameservers = ["8.8.8.8" "8.8.4.4"];

        # Must be prepared ahead
        identityFile = "/home/${globals.user}/.ssh/id_ed25519";
        #passwordHash = nixpkgs.lib.fileContents ../../password.sha512;

        # Programs and services
        neovim.enable = true;

        services.openssh.enable = true;
      }
    ];
  }
