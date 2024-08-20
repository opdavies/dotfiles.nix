{ pkgs, username, ... }:
{
  name = "export-video-list";

  runtimeInputs = with pkgs; [
    jq
    tree
    udisks
  ];

  text = ''
    device_name="/dev/sda2"
    device_label="UNTITLED"

    source_path="/run/media/${username}/$device_label"

    # If the source path doesn't exist, try mounting the device.
    if [[ ! -d "$source_path" ]]; then
      ${pkgs.udisks}/bin/udisksctl mount -b "$device_name"
    fi

    # Exit early if the source path still doesn't exist.
    if [[ ! -d "$source_path" ]]; then
      echo "Error: $source_path not found."
      exit 1
    fi

    output_file="$HOME/Documents/videos.json"

    ${pkgs.tree}/bin/tree -J "$source_path/Videos" | jq . > "$output_file"
    ${pkgs.jq}/bin/jq . < "$output_file"
  '';
}
