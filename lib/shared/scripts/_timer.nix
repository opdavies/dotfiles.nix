{
  name = "_timer";

  runtimeInputs = [ ];

  text = ''
    mins=$1
    message=''${2:-Time out!}

    sleep -- "$mins" * 60
    notify-send -t 0 "''${message}" "Your timer of $mins min is over" -u normal
  '';
}
