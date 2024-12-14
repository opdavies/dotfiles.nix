{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { inherit callPackage; };
in
{
  build-glove80 = callPackage ./build-glove80.nix { };
  custom-tmux-sessionizer = callPackage ./tmux-sessionizer.nix { };
  notes = callPackage ./notes.nix { };
  notify-battery = callPackage ./notify-battery.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
