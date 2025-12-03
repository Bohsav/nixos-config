_: {
  plugins.flash = {
    enable = true;

    settings = {
      modes.char.keys = {
        __unkeyed-0 = "";
        __unkeyed-1 = "";
        __unkeyed-2 = "";
        __unkeyed-3 = "";
        __unkeyed-4 = "";
        __unkeyed-5 = "";
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
      action.__raw = "function() require('flash').toggle() end";
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
      key = "gfs";
      action.__raw = "function() require('flash').jump() end";
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
      key = "gfS";
      action.__raw = "function() require('flash').treesitter() end";
      options = {
        desc = "Flash Treesitter";
      };
    }
    {
      mode = "o";
      key = "gfr";
      action.__raw = "function() require('flash').remote() end";
      options = {
        desc = "Flash Remote";
      };
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "gfr";
      action.__raw = "function() require('flash').treesitter_search() end";
      options = {
        desc = "Flash Treesitter Search";
      };
    }
  ];
}
