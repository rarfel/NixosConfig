{ pkgs, inputs, ... }:
{
  home-manager.users.rarfel = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = {
      enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "default";
          position = "top";
          showCapsule = true;
	  showOutline = false;
	  backgroundOpacity = 0.8;
	  barType = "simple";
	  useSeparateOpacity = false;
	  floating = false;
	  marginVertical = 4;
	  marginHorizontal = 4;
	  frameThickness = 12;
	  outerCorners = true;
	  hideOnOverview = true;
	  displayMode = "always_visible";
	  autoHideDelay = 500;
	  autoShowDelay = 150;
          widgets = {
            right = [
	      {
	      	colorizeIcons = false;
		hideMode = "hidden";
		id = "ActiveWindow";
		maxWidth = 140;
		scrollingMode = "hover";
		showIcon = true;
		useFixedWidth = false;
	      }
	      {
                id = "Network";
              }
              {
                id = "Bluetooth";
		displayMode = "onhover";
              }
	      {
	      	id = "Volume";
		displayMode = "onhover";
	      }
	      {
	      	id = "Brightness";
		displayMode = "onhover";
	      }
	      {
                id = "ControlCenter";
                useDistroLogo = true;
		colorizedDistroLogo = false;
		colorizedSystemIcon = "primary";
              }

            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
		characterCount = 2;
                colorizeIcons = false;
                emptyColor = "secondary";
		enableScrollWheel = true;
                focusedColor = "primary";
                followFocusedScreen = false;
                groupedBorderOpacity = 1;
                iconScale = 0.8;
                occupiedColor = "secondary";
                pillSize = 0.6;
                reverseScroll = false;
                showApplications = false;
                showBadge = true;
                showLabelsOnlyWhenOccupied = false;
                unfocusedIconsOpacity = 1;
              }
            ];
            left = [
              {
                formatHorizontal = "dd/mm/yyyy - [HH:mm:ss]";
		clockColor = "none";
                formatVertical = "HH mm - ddd[dd], MMM";
                id = "Clock";
                useMonospacedFont = true;
		tolltipFormat = "HH:mm ddd[dd], MMM";
                usePrimaryColor = true;
              }
	      {
	      	compactMOde = false;
		diskPath = "/";
		iconColor = "none";
		id = "SystemMonitor";
		showCpuUsage = true;
		showDiskUsage = true;
		showMemoryAsPercentage = true;
		showMemoryUsage = true;
		useMonospaceFont = true;

	      }
	      {
                alwaysShowPercentage = false;
                id = "Battery";
		displayMode = "alwaysShow";
		hideIfIdle = false;
		showPowerProfile = true;
                warningThreshold = 30;
		hideIfNotDetected = false;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        general = {
          avatarImage = "/home/rarfel/Images/funnySkeleton.png";
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = false;
          name = "Minas Gerais, Brasil";
        };
      };
      # path to json file if someday i know what im really doing
    };
  };
}
