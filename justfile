default:
  just --list

clean:
  rm -rf ./result

apollo command *args: && clean
  sudo nixos-rebuild {{ command }} --flake .#apollo {{ args }}

pop-os command *args: && clean
  home-manager {{ command }} -f home-manager/home.nix --flake .#pop-os {{ args }}

wsl2 command *args: && clean
  home-manager {{ command }} -f home-manager/home.nix --flake .#wsl2 {{ args }}

update *args:
  nix flake update {{ args }}
