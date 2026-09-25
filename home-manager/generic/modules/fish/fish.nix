{
  config,
  pkgs,
  lib,
  hostname,
  user,
  ...
}:
{

  programs.fish = {
    enable = true;

    shellAliases = {
      build-home-config = "home-manager switch -b backup --flake ~/nixos-config#${user}@${hostname}";
      build-system-config = "sudo nixos-rebuild switch --flake ~/nixos-config#${hostname}";
    };

    shellInit = ''
      export EDITOR=nvim
    '';

    shellInitLast = "enable_transience";
  };
  programs.tmux.shell = "${pkgs.fish}/bin/fish";
  home.shell.enableFishIntegration = true;
}
