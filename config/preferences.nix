{
  globals = {
    mapleader = " ";
  };
  globalOpts = {
    # Display
    wrap = true;
    linebreak = true;
    breakindent = true;
    conceallevel = 3;
    showmatch = true;
    list = true;
    scrolloff = 0;

    # Line number
    number = true;
    relativenumber = true;

    # Tabs and indenting
    tabstop = 2;
    softtabstop = -1; # Uses shiftwidth when -1
    smartindent = true;
    shiftwidth = 2;
    shiftround = true;
    expandtab = true;

    spelllang = [ "en_gb" ];

    splitright = true;

    smartcase = true;

    mouse = "a";
    ttyfast = true;
    clipboard = "unnamedplus";
  };
}
