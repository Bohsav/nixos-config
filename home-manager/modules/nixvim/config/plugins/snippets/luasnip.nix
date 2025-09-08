{ pkgs, ... }:
{
  plugins.luasnip = {
    enable = true;
    fromSnipmate = [
      {
        paths =
          (pkgs.fetchFromGitHub {
            owner = "honza";
            repo = "vim-snippets";
            rev = "f371d635f6f6350d34bbb483e37e383db322d145";
            sha256 = "";
          })
          + "/snippets";
        include = [
          "markdown"
          "python"
          "go"
        ];
      }
    ];
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
  };
}
