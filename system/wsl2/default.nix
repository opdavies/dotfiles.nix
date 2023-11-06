{ inputs, pkgs, self, system, username }:

let
  shared-config = import ../shared/home-manager.nix { inherit inputs pkgs self username; };
  shared-packages = import ../shared/home-manager-packages.nix { inherit inputs pkgs; };
in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    {
      imports = [ shared-config ];

      home.packages = shared-packages;

      home.sessionVariables = {
        EDITOR = "nvim";
        EXA_COLORS = "uu=38;5;255:gu=38;5;255:ur=38;5;255:uw=38;5;255:ue=38;5;255:wx=38;5;255:gr=38;5;250:gw=38;5;250:gx=38;5;250:tr=38;5;255:tw=38;5;255:tx=38;5;255:da=38;5;250:sn=32:sb=0:di=38;5;105";
        PATH = "$PATH:./vendor/bin:./node_modules/.bin";
        PULUMI_SKIP_UPDATE_CHECK = "true";
        RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
      };
    }
  ];
}
