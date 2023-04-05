default:
  just --list

clean:
  rm -rf ./result

nixos profile command: && clean
  sudo nixos-rebuild {{ command }} --flake .#{{ profile }}

wsl2 command: && clean
  home-manager {{ command }} -f home-manager/home.nix --flake .#wsl2

update:
  nix flake update
