{}: {
  config = { allowUnfree = true; };

  overlays = [ (import ./overlays.nix) ];
}
