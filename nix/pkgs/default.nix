{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { inherit callPackage; };
in
{
  build-glove80 = callPackage ./build-glove80.nix { };
  notes = callPackage ./notes.nix { };
  notify-battery = callPackage ./notify-battery.nix { };
  tmux-sessionizer = callPackage ./tmux-sessionizer.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
