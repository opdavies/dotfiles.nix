{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [ screenkey ];

  home-manager.users.${username}.xdg.configFile."screenkey.json".text = builtins.toJSON {
    key_mode = "composed";
    mods_mode = "emacs";
    persist = true;
    size = "small";
    timeout = 0.25;
  };
}
