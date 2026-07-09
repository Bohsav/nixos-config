{
  plugins.mini = {
    enable = true;

    modules = {
      indentscope = {
        symbol = "│";
        options = {
          try_as_border = true;
        };
      };
      move = {
        mappings = {
          down = "<M-j>";
          left = "<M-h>";
          line_down = "<M-j>";
          line_left = "<M-h>";
          line_right = "<M-l>";
          line_up = "<M-k>";
          right = "<M-l>";
          up = "<M-k>";
        };
      };
    };
  };
}
