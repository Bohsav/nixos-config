_: {
  plugins.leap = {
    enable = true;
  };
  keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "<leader>:";
      action = "<Plug>(leap)";
      options = {
        desc = "Default leap";
      };
    }
  ];
}
