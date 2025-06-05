{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        imports = [
          "./lsp-languages.nix"
          "./visuals.nix"
          "./ui.nix"
        ];
        # options = {
        #   shiftwidth = 4;
        #   tabstop = 4;
        # };
        viAlias = true;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        spellcheck = {
          enable = true;
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "auto";
          };
        };

        theme = {
          enable = true;
          name = "tokyonight";
          style = "storm";
          transparent = false;
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        minimap = {
          minimap-vim.enable = false;
        };

        dashboard = {
          dashboard-nvim.enable = false;
        };

        notify = {
          nvim-notify.enable = true;
        };

        utility = {
          sleuth.enable = true;
          ccc.enable = false;
          vim-wakatime.enable = false;
          diffview-nvim.enable = true;
          yanky-nvim.enable = false;
          multicursors.enable = true;

          motion = {
            hop.enable = true;
            leap.enable = true;
          };
          images = {
            image-nvim.enable = false;
          };
        };

        notes = {
          obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
          neorg.enable = false;
          orgmode.enable = false;
          todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = false;
            cmp.enable = true;
          };
          codecompanion-nvim.enable = false;
        };

        session = {
          nvim-session-manager.enable = false;
        };

        gestures = {
          gesture-nvim.enable = false;
        };

        comments = {
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = false;
        };
      };
    };
  };
}
