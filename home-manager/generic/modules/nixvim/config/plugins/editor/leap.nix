_: {
  # Think of it as mouse pointer with keyboard
  # After command trigger, press the first letter of where you want to go
  # Then press the second letter, and type until you either jump automatically
  # OR finish off with the label beside
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
      key = "<M-s>";
      action = "<Plug>(leap)";
      options = {
        desc = "Default leap";
      };
    }
  ];
}
