default:
  just --list

apollo command *args:
  sudo nixos-rebuild {{ command }} --flake .#apollo {{ args }}

pop-os command *args:
  home-manager {{ command }} -f home-manager/home.nix --flake .#pop-os {{ args }}

wsl2 command *args:
  home-manager {{ command }} -f home-manager/home.nix --flake .#wsl2 {{ args }}

update *args:
  nix flake update {{ args }}
