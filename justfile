default:
  just --list

apollo *args:
  sudo nixos-rebuild switch --flake .#apollo {{ args }}

pop-os *args:
  home-manager switch -f home-manager/home.nix --flake .#pop-os {{ args }}

wsl2 *args:
  home-manager switch -f home-manager/home.nix --flake .#wsl2 {{ args }}

update:
  nix flake update
