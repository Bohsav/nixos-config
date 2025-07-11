{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    shellAliases = {
      edit-config = "nnn ~/nixos-config";
      build-home-config = "home-manager switch --flake ~/nixos-config";
      build-system-config = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = ".p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
      {
        name = "nnn-cd_on_q";
        src = ./nnn;
        file = "cd_on_q.zsh";
      }
      # {
      #   name = "nnn-diffs";
      #   src = ./nnn;
      #   file = "diffs.zsh";
      # }
      # {
      #   name = "nnn-dragdrop";
      #   src = ./nnn;
      #   file = "dragdrop.zsh";
      # }
      # {
      #   name = "nnn-preview-tui";
      #   src = ./nnn;
      #   file = "preview-tui.zsh";
      # }
    ];

    initContent = let
      zshExport = lib.mkOrder 500 ''
        export EDITOR=nvim
        export NNN_FIFO=/tmp/nnn.fifo
      '';
      zshInitFinal = lib.mkOrder 1000 ''
        # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
        # Initialization code that may require console input (password prompts, [y/n]
        # confirmations, etc.) must go above this block; everything else may go below.
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
        # autoSuggestions config

        unsetopt correct # autocorrect commands

        setopt hist_ignore_all_dups # remove older duplicate entries from history
        setopt hist_reduce_blanks # remove superfluous blanks from history items
        setopt inc_append_history # save history entries as soon as they are entered

        # auto complete options
        setopt auto_list # automatically list choices on ambiguous completion
        setopt auto_menu # automatically use menu completion
        zstyle ':completion:*' menu select # select completions with arrow keys
        zstyle ':completion:*' group-name "" # group results by category
        zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
      '';
    in
      lib.mkMerge [zshExport zshInitFinal];

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo"];
    };
  };
}
