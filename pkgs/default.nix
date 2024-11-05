{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;
in
{
  vimPlugins = prev.vimPlugins // {
    conf-vim = callPackage ./vim-plugins/conf-vim.nix { };
    edit-alternate-vim = callPackage ./vim-plugins/edit-alternate-vim.nix { };
    nvim-tmux-navigation = callPackage ./vim-plugins/nvim-tmux-navigation.nix { };
    standard-vim = callPackage ./vim-plugins/standard-vim.nix { };
    tabline-vim = callPackage ./vim-plugins/tabline-vim.nix { };
    vim-autoread = callPackage ./vim-plugins/vim-autoread.nix { };
    vim-caser = callPackage ./vim-plugins/vim-caser.nix { };
    vim-heritage = callPackage ./vim-plugins/vim-heritage.nix { };
    vim-textobj-indent = callPackage ./vim-plugins/vim-textobj-indent.nix { };
    vim-textobj-xmlattr = callPackage ./vim-plugins/vim-textobj-xmlattr.nix { };
    vim-zoom = callPackage ./vim-plugins/vim-zoom.nix { };
  };
}
