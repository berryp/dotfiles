# Adopted from here: https://github.com/DieracDelta/vimconfig/blob/801b62dd56cfee59574639904a6c95b525725f66/plugins.nix
inputs: _final: prev: let
  # Use nixpkgs vimPlugin but with source directly from plugin author
  withSrc = pkg: src: pkg.overrideAttrs (_: {inherit src;});
  # Package plugin - disabling until in use
  # plugin = pname: src:
  #   prev.vimUtils.buildVimPluginFrom2Nix {
  #     inherit pname src;
  #     version = "master";
  #   };
in {
  nil = inputs.nil.packages.${prev.system}.nil;

  nvim-lspconfig =
    withSrc prev.vimPlugins.nvim-lspconfig inputs.nvim-lspconfig;
  cmp-nvim-lsp = withSrc prev.vimPlugins.cmp-nvim-lsp inputs.cmp-nvim-lsp;
  null-ls-nvim = withSrc prev.vimPlugins.null-ls-nvim inputs.null-ls-nvim;
  comment-nvim = withSrc prev.vimPlugins.comment-nvim inputs.comment-nvim;
  nvim-treesitter =
    withSrc prev.vimPlugins.nvim-treesitter inputs.nvim-treesitter;
  telescope-nvim =
    withSrc prev.vimPlugins.telescope-nvim inputs.telescope-nvim;
  telescope-project-nvim =
    withSrc prev.vimPlugins.telescope-project-nvim
    inputs.telescope-project-nvim;
  toggleterm-nvim =
    withSrc prev.vimPlugins.toggleterm-nvim inputs.toggleterm-nvim;
  bufferline-nvim =
    withSrc prev.vimPlugins.bufferline-nvim inputs.bufferline-nvim;
  nvim-tree-lua = withSrc prev.vimPlugins.nvim-tree-lua inputs.nvim-tree-lua;

  # Packaging plugins with Nix
  # comment-nvim = plugin "comment-nvim" comment-nvim-src;
  # plenary-nvim = plugin "plenary-nvim" plenary-nvim-src;
}
