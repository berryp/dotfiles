{
  config,
  pkgs,
  lib,
  ...
}: let
  neovim = import ./package {
    inherit pkgs;
    colors = config.theme.colors;
    github = true;
  };
in {
  options.neovim.enable = lib.mkEnableOption "Neovim.";

  config = lib.mkIf config.neovim.enable {
    home-manager.users.${config.user} = {
      home.packages = [neovim];

      programs.git.extraConfig.core.editor = "nvim";
      home.sessionVariables = {
        EDITOR = "nvim";
        MANPAGER = "nvim +Man!";
      };
      programs.fish = {
        shellAliases = {
          vim = "nvim";
          vi = "nvim";
        };
        shellAbbrs = {
          v = lib.mkForce "nvim";
          vl = lib.mkForce "nvim -c 'normal! `0' -c 'bdelete 1'";
          vll = "nvim -c 'Telescope oldfiles'";
        };
      };
    };

    # # Used for icons in Vim
    # fonts.fonts = with pkgs; [ nerdfonts ];
  };
}
