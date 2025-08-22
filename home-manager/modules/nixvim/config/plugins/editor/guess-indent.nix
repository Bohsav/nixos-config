{
  plugins.guess-indent = {
    enable = true;

    settings = {
      auto_cmd = true;
      filetype_exclude = [
        "markdown"
        "tutor"
        "netrw"
      ];
      buftype_exclude = [
        "help"
        "nofile"
        "terminal"
        "prompt"
      ];

      on_space_options = {
        expandtab = true;
        shiftwidth = "detected";
        softtabstop = "detected";
        tabstop = "detected";
      };

      on_tab_options = {
        expandtab = false;
      };

      override_editorconfig = true;
    };
  };
}
