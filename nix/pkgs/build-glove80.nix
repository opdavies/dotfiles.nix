{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "build-glove80";

  runtimeInputs = with pkgs; [
    cachix
    git
    nix
  ];

  text = ''
    BRANCH="''${1:-main}"
    SRC_DIR="''${PWD}/src"
    CONFIG_DIR="''${PWD}/config"
    NIX_FILE="''${CONFIG_DIR}/default.nix"

    # Ensure cachix is configured
    echo "Using moergo-glove80-zmk-dev cache"
    cachix use moergo-glove80-zmk-dev

    # Clone or update the ZMK repository
    if [ ! -d "$SRC_DIR" ]; then
      echo "Cloning ZMK repository into ./src..."
      git clone https://github.com/moergo-sc/zmk "$SRC_DIR"
    else
      echo "Updating ZMK repository in ./src..."
      git -C "$SRC_DIR" fetch --all
    fi

    # Checkout the specified branch or tag
    echo "Checking out branch/tag: $BRANCH in ./src"
    git -C "$SRC_DIR" checkout -q --detach "$BRANCH"

    # Build firmware using Nix
    echo "Building firmware from: $NIX_FILE"
    nix-build "$NIX_FILE" --arg firmware "import ''${SRC_DIR}/default.nix {}" -j2 -o ./glove80.uf2 --show-trace

    echo "Firmware built successfully: $(realpath ./glove80.uf2)"
  '';
}
