{
  plugins.flash = {
    enable = true;

    settings = {
      modes.char.keys = {
        __unkeyed-0 = "f";
        __unkeyed-1 = "F";
        __unkeyed-2 = "t";
        __unkeyed-3 = "T";
        __unkeyed-4 = ";";
        __unkeyed-5 = ",";
      };

      prompt = {
        enabled = true;
        prefix = [
          [
            "⚡"
            "FlashPromptIcon"
          ]
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "c";
      key = "<C-s>";
      action.__raw = ''require("flash").toggle()'';
      options = {
        desc = "Toggle Flash Search";
      };
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = ''require("flash").jump()'';
      options = {
        desc = "Flash Search";
      };
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = ''require("flash").treesitter()'';
      options = {
        desc = "Flash Treesitter";
      };
    }
    {
      mode = "o";
      key = "r";
      action.__raw = ''require("flash").remote()'';
      options = {
        desc = "Flash Remote";
      };
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "r";
      action.__raw = ''require("flash").treesitter_search()'';
      options = {
        desc = "Flash Treesitter Search";
      };
    }
  ];
}
