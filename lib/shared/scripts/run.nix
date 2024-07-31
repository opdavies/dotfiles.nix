{ pkgs }:

{
  name = "run";

  runtimeInputs = with pkgs; [ bashInteractive ];

  text = ''
    if [[ -e .ignored/run ]]; then
      .ignored/run "$@"
      exit $?
    fi

    ./run "$@"
  '';
}
