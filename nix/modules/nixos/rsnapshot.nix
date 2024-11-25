{ pkgs, ... }:

let
  backups1 = {
    path = "/mnt/backup";
    uuid = "fd47c61a-8aac-44ed-9a18-4ec43ee663fb";
  };
in
{
  systemd = {
    mounts = [
      {
        where = "${backups1.path}";
        what = "UUID=${backups1.uuid}";
        type = "ext4";
        options = "defaults,noatime,nofail";
      }
    ];

    automounts = [
      {
        where = "${backups1.path}";
        automountConfig.TimeoutIdleSec = "60";
      }
    ];
  };

  systemd.tmpfiles.rules = [
    "d ${backups1.path} 755 root root -"
  ];

  services = {
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="block", ENV{ID_FS_UUID}=="${backups1.uuid}", ENV{SYSTEMD_WANTS}="mnt-backup.mount"
      ACTION=="remove", SUBSYSTEM=="block", ENV{ID_FS_UUID}=="${backups1.uuid}", RUN+="${pkgs.systemd}/bin/systemctl stop mnt-backup.mount"
    '';

    rsnapshot = {
      enable = true;
      enableManualRsnapshot = true;

      extraConfig = ''
        lockfile	/home/opdavies/.rsnapshot.pid

        snapshot_root	/mnt/backup/rsnapshot/
        no_create_root	1

        backup	/home/opdavies	opdavies/
        backup	/media	media/
        backup	/var/lib/immich/upload	immich/

        exclude	".cache/"
        exclude	".devenv/"
        exclude	".direnv/"
        exclude	"node_modules/"
        exclude	"vendor/"

        retain	daily	7
        retain	weekly	4
        retain	monthly	12
      '';

      cronIntervals = {
        daily = "0 21 * * *";
        monthly = "0 23 1 * 0";
        weekly = "0 22 * * 0";
      };
    };
  };
}
