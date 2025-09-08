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
            sha-256 = "";
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
