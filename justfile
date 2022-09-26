default:
  just --list

pop-os *args:
  home-manager switch -f home-manager/home.nix --flake .#pop-os {{ args }}
