profile := `hostname`

_default:
    just --list

check:
    nix flake check

nixos-build:
    sudo nixos-rebuild build --flake ".#{{ profile }}"

nixos-switch:
    sudo nixos-rebuild switch --flake ".#{{ profile }}"

nixos-test:
    sudo nixos-rebuild test --flake ".#{{ profile }}"

update:
    nix flake update
