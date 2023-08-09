default:
  just --list

clean:
  rm -rf ./result

nixos profile command: && clean
  sudo nixos-rebuild {{ command }} --flake .#{{ profile }}

wsl2 command: && clean
  NIXPKGS_ALLOW_UNFREE=1 home-manager {{ command }} --flake .#wsl2 --impure

update:
  nix flake update
