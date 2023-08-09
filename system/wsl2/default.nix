{ inputs, system, username }:

let
  pkgs = inputs.nixpkgs.legacyPackages."${system}";

  shared-config = import ../shared/home-manager.nix { inherit inputs pkgs username; };
  shared-packages = import ../shared/home-manager-packages.nix { inherit inputs pkgs; };
in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    { imports = [ shared-config ]; }
    { home.packages = shared-packages; }
  ];
}
