{ pkgs, ... }:
let
  window_border = "padded";
in
{
  plugins = {
    blink-cmp = {
      enable = true;
      callSetup = null;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          "<C-b>" = [ "scroll_documentation_down" ];
          "<C-f>" = [ "scroll_documentation_up" ];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-j>" = [ "select_next" ];
          "<C-k>" = [ "select_prev" ];
          "<C-e>" = [ "hide" ];
          "<C-y>" = [ "select_and_accept" ];
        };
        appearance.use_nvim_cmp_as_default = true;

        completion = {
          accept.create_undo_point = true;
          accept.auto_brackets = {
            enabled = true;

            blocked_filetypes = [
              "vim"
              "TelescopePrompt"
            ];
          };

          ghost_text.enabled = true;

          list = {
            max_items = 50;

            selection.auto_insert = true;
            selection.preselect = false;
          };

          menu = {
            enabled = true;

            border = window_border;
          };

          documentation.window.border = window_border;
        };

        signature.enabled = true;

        sources.default = [
          "lsp"
          "snippets"
          "path"
          "buffer"
        ];

        sources.providers = {
          lsp.score_offset = 100;
          path.score_offset = 1;
          snippets.score_offset = 0;
          buffer.score_offset = 0;
        };
      };
    };
  };
}
