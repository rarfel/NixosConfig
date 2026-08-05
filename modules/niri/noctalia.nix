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
      #settings = {};
      # importing json config
      inherit (builtins.fromJSON
          (builtins.readFile ./settings.json));
    };
  };
}
