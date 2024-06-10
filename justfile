_default:
    just --list

check:
    nix flake check

fmt:
    nix fmt flake.nix lib

nixos-build *args:
    sudo nixos-rebuild build --flake . {{ args }}

nixos-switch *args:
    sudo nixos-rebuild switch --flake . {{ args }}

nixos-test *args:
    sudo nixos-rebuild test --flake . {{ args }}

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
