default:
  just --list

clean:
  rm -rf ./result

nixos command profile: && clean
  sudo nixos-rebuild {{ command }} --flake .#{{ profile }}

pop-os command *args: && clean
  NIXPKGS_ALLOW_UNFREE=1 home-manager {{ command }} -f home-manager/home.nix --impure --flake .#pop-os {{ args }}

wsl2 command *args: && clean
  home-manager {{ command }} -f home-manager/home.nix --flake .#wsl2 {{ args }}

update *args:
  nix flake update {{ args }}
