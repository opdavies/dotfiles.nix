{ inputs, ... }:

{
  additions =
    final: prev:
    import ../pkgs {
      inherit prev;

      pkgs = final;
    };

  modifications = final: prev: { };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      config.allowUnfree = true;
      system = final.system;
    };
  };
}
