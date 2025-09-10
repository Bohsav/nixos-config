{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    go-nvim
  ];

  # extraConfigLua = ''
  #
  # '';
}
