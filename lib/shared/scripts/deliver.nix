{ pkgs }:
{
  name = "deliver";

  runtimeInputs = with pkgs; [ docker ];

  text = ''
    set +o pipefail

    # Based on https://github.com/jessarcher/dotfiles/blob/ef692c35d64db2c13674dfc850a23b6acf9e8f91/scripts/deliver.

    docker_compose_service_name=$(docker compose ps --services 2>/dev/null | grep '^app\|php$' | head -n1)

    if [[ "$docker_compose_service_name" != "" ]]; then
      if [ -t 1 ]; then
        "${pkgs.docker}/bin/docker" compose exec "$docker_compose_service_name" "$@"
      else
        # The command is not being run in a TTY
        "${pkgs.docker}/bin/docker" compose exec -T "$docker_compose_service_name" "$@"
      fi
    else
      "$@"
    fi
  '';
}
