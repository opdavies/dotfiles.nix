{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "notes";
  version = "0.3.0";

  src = pkgs.fetchFromGitHub {
    owner = "nickjj";
    repo = "notes";
    rev = "v${version}";
    sha256 = "gyrsTWPT8w4DsRim3jlbjvpXwX/y+7SwLaM+3LVOJdU=";
  };

  buildInputs = with pkgs; [ bash ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/notes $out/bin/notes
    chmod +x $out/bin/notes
  '';
}
