_default:
    just --list

check:
    nix flake check

nixos-build:
    sudo nixos-rebuild build --flake .

nixos-switch profile:
    sudo nixos-rebuild switch --flake .

nixos-test profile:
    sudo nixos-rebuild test --flake .

update:
    nix flake update
