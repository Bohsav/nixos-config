{pkgs, ...}:

{

  programs.nixvim = {
    enable = true;

    colorschemes.nightfox = {
      enable = true;
      flavor = "duskfox";
    };    

    opts = {
      number = true;
      relativenumber = true;
      
      shiftwidth = 2;
    };
  };

}
