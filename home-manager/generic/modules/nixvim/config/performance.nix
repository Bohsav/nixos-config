{ ... }: {
  performance = {
    byteCompileLua = {
      enable = true;

      configs = true;
      initLua = true;
      luaLib = true;
      plugins = true;
    };
  };
}
