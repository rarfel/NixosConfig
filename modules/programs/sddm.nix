{ config, pkgs, ... }:

let
    sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "purple_leaves";
    #themeConfig = {
        #HeaderTextColor = "#710bde";
        #HeaderTextColor = "#ff0000";
        #Background = "/home/rarfel/Images/ToYourEternity/fushiChair.png";
    #};
  }).overrideAttrs
    (oldAttrs: {
      #installPhase = oldAttrs.installPhase + ''
      #  chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      #  cp ${/home/rarfel/Images/ToYourEternity/fushiChair.png} \
      #  $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/fushiChair.png
      #'';
  });

in {
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "weston";
    };
    autoNumlock = true;
    enableHidpi = true;
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    extraPackages = with pkgs; [
      sddm-astronaut
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    kdePackages.qtmultimedia
  ];
}
