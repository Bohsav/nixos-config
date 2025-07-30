{
  plugins.navbuddy = {
    enable = true;

    mappings = {
      "0" = "root";
      "<C-s>" = "hsplit";
      "<C-v>" = "vsplit";
      "<enter>" = "select";
      "<esc>" = "close";
      A = "append_scope";
      F = "fold_delete";
      I = "insert_scope";
      J = "move_down";
      K = "move_up";
      V = "visual_scope";
      Y = "yank_scope";
      a = "append_name";
      c = "comment";
      d = "delete";
      f = "fold_create";
      h = "parent";
      i = "insert_name";
      j = "next_sibling";
      k = "previous_sibling";
      l = "children";
      o = "select";
      q = "close";
      r = "rename";
      s = "toggle_preview";
      v = "visual_name";
      y = "yank_name";
    };

    icons = {
      Array = "󰅪 ";
      Boolean = " ";
      Class = " ";
      Constant = "󰏿 ";
      Constructor = " ";
      Enum = " ";
      EnumMember = " ";
      Events = " ";
      Field = " ";
      File = "󰈙 ";
      Function = "󰊕 ";
      Interface = "󰕘 ";
      Method = "󰆧 ";
      Module = "󰡢 ";
      Namespace = "󰌗 ";
      Null = "󰟢 ";
      Number = "󰎠 ";
      Object = "󰅩 ";
      Operator = "󰆕 ";
      Package = " ";
      Property = " ";
      String = "󰀬 ";
      Struct = " ";
      TypeParameter = "󰊄 ";
      Variable = " ";
    };

    # Whether to automatically attach to the lsp server. May cause errors
    lsp.autoAttach = true;

    nodeMarkers = {
      enabled = true;

      icons = {
        branch = "  ";
        leaf = " ";
        leafSelected = " → ";
      };
    };

    sourceBuffer = {
      followNode = true;
      highlight = true;
      reorient = "smart";
      scrolloff = null;
    };

    window = {
      border = "rounded";
      position = 50;
      scrolloff = null;
      size = 60;

      sections.left = {
        border = "rounded";
        size = "20";
      };

      sections.mid = {
        border = "rounded";
        size = "40";
      };

      sections.right = {
        border = "rounded";
        preview = "leaf";
      };
    };
  };
}
