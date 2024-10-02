{
  services.autorandr = {
    enable = true;

    profiles =
      let
        fingerprint = "00ffffffffffff000dae081400000000251d0104a51f117802ee95a3544c99260f505400000001010101010101010101010101010101363680a0703820403020350035ad1000001a000000fe004e3134304843472d4551310a20000000fe00434d4e0a202020202020202020000000fe004e3134304843472d4551310a200084";
        name = "eDP-1";
      in
      {
        default = {
          fingerprint = {
            "${name}" = fingerprint;
          };

          config = {
            "${name}" = {
              enable = true;
              mode = "1920x1080";
            };
          };
        };

        desktop = {
          config = {
            "${name}".enable = false;

            "HDMI-1" = {
              enable = true;
              mode = "3840x2160";
              primary = true;
              rate = "59.95";
            };
          };

          fingerprint = {
            "${name}" = fingerprint;
            "HDMI-1" = "00ffffffffffff004c2d1710424e58432b1f0103803f24782ac8b5ad50449e250f5054bfef80714f810081c081809500a9c0b300010108e80030f2705a80b0588a0078682100001e000000fd00324b1e873c000a202020202020000000fc004c5532385235350a2020202020000000ff0048345a524130303132380a20200183020335f04961120313041f10605f2309070783010000e305c0006b030c002000b83c2000200167d85dc401788003e20f81e3060501023a801871382d40582c450078682100001e023a80d072382d40102c458078682100001e04740030f2705a80b0588a0078682100001e565e00a0a0a029503020350078682100001a000049";
          };
        };
      };

    hooks.postswitch = {
      "reload-awesome" = ''echo 'awesome.restart()' | awesome-client'';
    };
  };
}
