{ config, pkgs, lib, ... }: {

  options.python.enable = lib.mkEnableOption "Python programming language.";

  config = lib.mkIf config.python.enable {

    home-manager.users.${config.user} = {

      home.packages = with pkgs; [
        # python312 # Standard Python interpreter
        nodePackages.pyright # Python language server
        black # Python formatter
        python312Packages.flake8 # Python linter
      ];

      programs.fish.shellAbbrs = { py = "python3"; };

    };

  };

}
