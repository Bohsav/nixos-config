{
  lsp = {
    enable = true;
    formatOnSave = true;
    lspkind.enable = false;
    lightbulb.enable = true;
    lspsaga.enable = false;
    trouble.enable = true;
    lspSignature.enable = true;
  };

  # This section does not include a comprehensive list of available language modules.
  # To list all available language module options, please visit the nvf manual.
  languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    # Languages that will be supported in default and maximal configurations.
    nix.enable = true;
    markdown.enable = true;

    # Language modules that are not as common.
    assembly.enable = false;
    astro.enable = false;
    nu.enable = false;
    csharp.enable = false;
    julia.enable = false;
    vala.enable = false;
    scala.enable = false;
    r.enable = false;
    gleam.enable = false;
    dart.enable = false;
    ocaml.enable = false;
    elixir.enable = false;
    haskell.enable = false;
    ruby.enable = false;
    fsharp.enable = false;

    tailwind.enable = false;
    svelte.enable = false;

    # Nim LSP is broken on Darwin and therefore
    # should be disabled by default. Users may still enable
    # `vim.languages.vim` to enable it, this does not restrict
    # that.
    # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
    nim.enable = false;
  };
}
