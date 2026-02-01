{ config, pkgs, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
      inputs.quickshell.packages.${system}.default
      inputs.noctalia.packages.${system}.default
    ];
}
