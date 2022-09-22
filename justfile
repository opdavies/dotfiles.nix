default:
  just --list

update:
  home-manager switch -f home-manager/home.nix
