{
  name = "timer";

  runtimeInputs = [ ];

  text = ''
    if [[ "$1" == "" ]]; then
      echo "Usage: ''${0##*/} <mins> [message]"
      exit 1
    fi

    mins=$1
    message=$2

    nohup _timer "$mins" "$message" &> /dev/null &

    echo "timer started for $mins min"
    echo "timer started for $mins min, message: '$message'" | systemd-cat -t timer
  '';
}
