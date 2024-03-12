_default:
    just --list

check:
    nix flake check

nixos-build profile:
    sudo nixos-rebuild build --flake ".#{{ profile }}"

nixos-switch profile:
    sudo nixos-rebuild switch --flake ".#{{ profile }}"

nixos-test profile:
    sudo nixos-rebuild test --flake ".#{{ profile }}"

update:
    nix flake update
