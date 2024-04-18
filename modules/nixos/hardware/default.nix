{ lib, ... }: {

  imports = [
    ./boot.nix
    ./disk.nix
    ./keyboard.nix
    ./networking.nix
    ./server.nix
  ];

  options = {
    physical = lib.mkEnableOption "Whether this machine is a physical device.";
    server = lib.mkEnableOption "Whether this machine is a server.";
  };

}
