{ pkgs, ... }:
{
  programs = {
    password-store.enable = true;
    gpg.enable = true;
  };
  services = {
    pass-secret-service.enable = true;
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      pinentry.program = "pinentry-tty";
      pinentry.package = pkgs.pinentry-tty;
    };
  };
}
