{ pkgs, inputs, ... }:
{
    # importing toml config
    xdg.configFile."noctalia/noctalia-config.toml".source = ./noctalia-config.toml;
}
