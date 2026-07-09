{ pkgs, lib, ... }:
let
  window_border_fancy = [
    "╭"
    "─"
    "╮"
    "│"
    "╯"
    "─"
    "╰"
    "│"
  ];
  window_border_default = "padded";
  window_border = window_border_default;

  icons = {
    Copilot = " ";
    Spell = " ";
    Vimtex = " ";
    Text = "󰊄";
    Method = "󰡱 ";
    Function = "󰊕 ";
    Constructor = " ";
    Field = "󰜢 ";
    Variable = "󰆦 ";
    Class = " ";
    Interface = "󱡠 ";
    Module = "󰕳 ";
    Property = " ";
    Unit = " ";
    Value = " ";
    Enum = " ";
    Keyword = " ";
    Snippet = " ";
    Color = " ";
    File = " ";
    Reference = " ";
    Folder = " ";
    EnumMember = " ";
    Constant = " 󰏿";
    Struct = " ";
    Event = " ";
    Operator = "󰪚 ";
    TypeParameter = "󰬛 ";
  };
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
        appearance.kind_icons = icons;

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

            draw.columns = lib.nixvim.mkRaw ''{ { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } }'';

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
          snippets = {
            preset = "luasnip";
            score_offset = 0;
          };
          buffer.score_offset = 10;
        };
      };
    };
  };
}
