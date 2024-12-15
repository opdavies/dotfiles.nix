{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.homelab.tubearchivist-container;

  port = 8000;
in
{
  options.features.homelab.tubearchivist-container = {
    enable = mkEnableOption "Enable the tubearchivist-container service.";
  };

  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    virtualisation.oci-containers.backend = "docker";

    virtualisation.oci-containers.containers."archivist-es" = {
      image = "bbilly1/tubearchivist-es";

      environment = {
        "ES_JAVA_OPTS" = "-Xms1g -Xmx1g";
        "discovery.type" = "single-node";
        "path.repo" = "/usr/share/elasticsearch/data/snapshot";
        "xpack.security.enabled" = "true";
      };

      environmentFiles = [
        config.age.secrets.tubearchivist.path
      ];

      volumes = [
        "tubearchivist_es:/usr/share/elasticsearch/data:rw"
      ];

      log-driver = "journald";

      extraOptions = [
        "--network-alias=archivist-es"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."docker-archivist-es" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_es.service"
      ];

      requires = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_es.service"
      ];

      partOf = [
        "docker-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "docker-compose-tubearchivist-root.target"
      ];
    };

    virtualisation.oci-containers.containers."archivist-redis" = {
      image = "redis/redis-stack-server";

      volumes = [
        "tubearchivist_redis:/data:rw"
      ];

      dependsOn = [
        "archivist-es"
      ];

      log-driver = "journald";

      extraOptions = [
        "--network-alias=archivist-redis"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."docker-archivist-redis" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_redis.service"
      ];

      requires = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_redis.service"
      ];

      partOf = [
        "docker-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "docker-compose-tubearchivist-root.target"
      ];
    };

    virtualisation.oci-containers.containers."tubearchivist" = {
      image = "bbilly1/tubearchivist";

      environment = {
        "ES_URL" = "http://archivist-es:9200";
        "HOST_GID" = "1000";
        "HOST_UID" = "1000";
        "REDIS_HOST" = "archivist-redis";
        "TA_HOST" = "tubearchivist.localhost";
        "TZ" = "Europe/London";
      };

      environmentFiles = [
        config.age.secrets.tubearchivist.path
      ];

      volumes = [
        "tubearchivist_cache:/cache:rw"
        "tubearchivist_media:/youtube:rw"
      ];

      ports = [
        "${toString port}:8000/tcp"
      ];

      dependsOn = [
        "archivist-es"
        "archivist-redis"
      ];

      log-driver = "journald";

      extraOptions = [
        "--health-cmd=[\"curl\", \"-f\", \"http://localhost:8000/health\"]"
        "--health-interval=2m0s"
        "--health-retries=3"
        "--health-start-period=30s"
        "--health-timeout=10s"
        "--network-alias=tubearchivist"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."docker-tubearchivist" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_cache.service"
        "docker-volume-tubearchivist_media.service"
      ];

      requires = [
        "docker-network-tubearchivist_default.service"
        "docker-volume-tubearchivist_cache.service"
        "docker-volume-tubearchivist_media.service"
      ];

      partOf = [
        "docker-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "docker-compose-tubearchivist-root.target"
      ];
    };

    systemd.services."docker-network-tubearchivist_default" = {
      path = [ pkgs.docker ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = "docker network rm -f tubearchivist_default";
      };

      script = ''
        docker network inspect tubearchivist_default || docker network create tubearchivist_default
      '';

      partOf = [ "docker-compose-tubearchivist-root.target" ];
      wantedBy = [ "docker-compose-tubearchivist-root.target" ];
    };

    systemd.services."docker-volume-tubearchivist_cache" = {
      path = [ pkgs.docker ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        docker volume inspect tubearchivist_cache || docker volume create tubearchivist_cache
      '';

      partOf = [ "docker-compose-tubearchivist-root.target" ];
      wantedBy = [ "docker-compose-tubearchivist-root.target" ];

    };

    systemd.services."docker-volume-tubearchivist_es" = {
      path = [ pkgs.docker ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        docker volume inspect tubearchivist_es || docker volume create tubearchivist_es
      '';

      partOf = [ "docker-compose-tubearchivist-root.target" ];
      wantedBy = [ "docker-compose-tubearchivist-root.target" ];
    };

    systemd.services."docker-volume-tubearchivist_media" = {
      path = [ pkgs.docker ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        docker volume inspect tubearchivist_media || docker volume create tubearchivist_media
      '';

      partOf = [ "docker-compose-tubearchivist-root.target" ];
      wantedBy = [ "docker-compose-tubearchivist-root.target" ];
    };

    systemd.services."docker-volume-tubearchivist_redis" = {
      path = [ pkgs.docker ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        docker volume inspect tubearchivist_redis || docker volume create tubearchivist_redis
      '';

      partOf = [ "docker-compose-tubearchivist-root.target" ];
      wantedBy = [ "docker-compose-tubearchivist-root.target" ];
    };

    systemd.targets."docker-compose-tubearchivist-root" = {
      unitConfig = {
        Description = "Root target generated by compose2nix.";
      };

      wantedBy = [ "multi-user.target" ];
    };

    services.nginx = {
      enable = true;

      virtualHosts."tubearchivist.davies.home".locations."/".proxyPass = "http://localhost:${toString port}/";
    };
  };
}
