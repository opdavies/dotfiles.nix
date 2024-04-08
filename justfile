_default:
    just --list

check:
    nix flake check

nixos-build:
    sudo nixos-rebuild build --flake .

nixos-switch:
    sudo nixos-rebuild switch --flake .

nixos-test:
    sudo nixos-rebuild test --flake .

update:
    nix flake update

wsl-build:
    NIXPKGS_ALLOW_UNFREE=1 home-manager build \
      --extra-experimental-features flakes \
      --extra-experimental-features nix-command \
      --flake ".#wsl2" \
      --impure

wsl-switch:
    NIXPKGS_ALLOW_UNFREE=1 home-manager switch \
      --extra-experimental-features flakes \
      --extra-experimental-features nix-command \
      --flake ".#wsl2" \
      --impure
