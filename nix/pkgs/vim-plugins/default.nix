{ callPackage }:

{
  conf-vim = callPackage ./conf-vim.nix { };
  edit-alternate-vim = callPackage ./edit-alternate-vim.nix { };
  nvim-tmux-navigation = callPackage ./nvim-tmux-navigation.nix { };
  standard-vim = callPackage ./standard-vim.nix { };
  vim-autoread = callPackage ./vim-autoread.nix { };
  vim-caser = callPackage ./vim-caser.nix { };
  vim-heritage = callPackage ./vim-heritage.nix { };
  vim-textobj-indent = callPackage ./vim-textobj-indent.nix { };
  vim-textobj-xmlattr = callPackage ./vim-textobj-xmlattr.nix { };
  vim-zoom = callPackage ./vim-zoom.nix { };
}
