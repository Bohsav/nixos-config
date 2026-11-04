{ ... }: {
  services.firewalld.enable = true;
  networking.nftables.enable = true;
}
