# Based on https://github.com/berryp/dotfiles
{
  description = "My systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    darwin = {
      url = "github:/lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs"; # Use system packages list where available
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Convert Nix to Neovim config
    nix2vim = {
      url = "github:gytis-ivaskevicius/nix2vim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim plugins
    nvim-lspconfig-src = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    cmp-nvim-lsp-src = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    null-ls-nvim-src = {
      url = "github:jose-elias-alvarez/null-ls.nvim";
      flake = false;
    };
    Comment-nvim-src = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    nvim-treesitter-src = {
      url = "github:nvim-treesitter/nvim-treesitter/v0.8.5.2";
      flake = false;
    };
    telescope-nvim-src = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    telescope-project-nvim-src = {
      url = "github:nvim-telescope/telescope-project.nvim";
      flake = false;
    };
    toggleterm-nvim-src = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };
    bufferline-nvim-src = {
      url = "github:akinsho/bufferline.nvim";
      flake = false;
    };
    nvim-tree-lua-src = {
      url = "github:kyazdani42/nvim-tree.lua";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    globals = rec {
      user = "berryp";
      fullName = "Berry Phillips";
      gitName = fullName;
      gitEmail = "berryphillips@gmail.com";
      dotfilesRepo = "git@github.com:berryp/dotfiles";
    };

    overlays = [
      inputs.nix2vim.overlay
      (import ./overlays/neovim-plugins.nix inputs)
      (import ./overlays/disko.nix inputs)
    ];

    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in rec {
    nixosConfigurations = {
      nixos = import ./hosts/nixos {inherit inputs globals overlays;};
    };

    homeConfigurations = {
      nixos = nixosConfigurations.nixos.config.home-manager.users.${globals.user}.home;
    };

    diskoConfigurations = {root = import ./disks/root.nix;};

    packages = let
      neovim = system: let
        pkgs = import nixpkgs {inherit system overlays;};
      in
        import ./modules/common/neovim/package {
          inherit pkgs;
          colors = (import ./colorscheme/tokyonight-dark).dark;
        };
    in {
      # Package Neovim config into standalone package
      x86_64-linux.neovim = neovim "x86_64-linux";
      x86_64-darwin.neovim = neovim "x86_64-darwin";
      aarch64-linux.neovim = neovim "aarch64-linux";
      aarch64-darwin.neovim = neovim "aarch64-darwin";
    };

    apps = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system overlays;};
      in
        import ./apps {inherit pkgs;}
    );

    checks = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system overlays;};
      in {
        neovim =
          pkgs.runCommand "neovim-check-health" {buildInputs = [inputs.self.packages.${system}.neovim];}
          ''
            mkdir -p $out
            export HOME=$TMPDIR
            nvim -c "checkhealth" -c "write $out/health.log" -c "quitall"

            # Check for errors inside the health log
            if $(grep "ERROR" $out/health.log); then
              cat $out/health.log
              exit 1
            fi
          '';
      }
    );

    formatter = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system overlays;};
      in
        pkgs.nixfmt-rfc-style
    );
  };
}
