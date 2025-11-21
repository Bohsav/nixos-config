{
  plugins.startup = {
    enable = true;

    settings = {
      options = {
        paddings = [
          1
          3
        ];
      };

      colors = {
        background = "#ffffff";
        foldedSection = "#ffffff";
      };

      parts = [
        "header"
        "body"
      ];

      sections = {
        header = {
          type = "text";
          oldfiles_directory = false;
          align = "center";
          fold_section = false;
          title = "Header";
          margin = 5;
          content = [
            "           ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖           "
            "           ▜███▙       ▜███▙  ▟███▛           "
            "            ▜███▙       ▜███▙▟███▛            "
            "             ▜███▙       ▜██████▛             "
            "      ▟█████████████████▙ ▜████▛     ▟▙       "
            "     ▟███████████████████▙ ▜███▙    ▟██▙      "
            "            ▄▄▄▄▖           ▜███▙  ▟███▛      "
            "           ▟███▛             ▜██▛ ▟███▛       "
            "          ▟███▛               ▜▛ ▟███▛        "
            " ▟███████████▛                  ▟██████████▙  "
            " ▜██████████▛                  ▟███████████▛  "
            "       ▟███▛ ▟▙               ▟███▛           "
            "      ▟███▛ ▟██▙             ▟███▛            "
            "     ▟███▛  ▜███▙           ▝▀▀▀▀             "
            "     ▜██▛    ▜███▙ ▜██████████████████▛       "
            "      ▜▛     ▟████▙ ▜████████████████▛        "
            "            ▟██████▙       ▜███▙              "
            "           ▟███▛▜███▙       ▜███▙             "
            "          ▟███▛  ▜███▙       ▜███▙            "
            "          ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘            "
          ];
          highlight = "Statement";
          defaultColor = "";
          oldfilesAmount = 3;
        };

        body = {
          type = "mapping";
          oldfiles_directory = false;
          align = "center";
          fold_section = false;
          title = "Menu";
          margin = 5;
          content = [
            [
              " Find File"
              "Telescope find_files"
              "ff"
            ]
            [
              "󰍉 Find Word"
              "Telescope live_grep"
              "fr"
            ]
            [
              " Recent Files"
              "Telescope oldfiles"
              "fg"
            ]
            [
              " File Browser"
              "Telescope file_browser"
              "fe"
            ]
          ];
          highlight = "string";
          defaultColor = "";
          oldfilesAmount = 0;
        };
      };
    };
  };
}
