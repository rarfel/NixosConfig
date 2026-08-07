{ pkgs, inputs, ... }:
{
    # importing json config
    xdg.configFile."noctalia/settings.json".source = ./settings.json;
}
