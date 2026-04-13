{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.nightfly ];
  globals = {
    nightflyTransparent = true;
    nightflyItalics = true;
    nightflyCursorColor = true;
  };
  colorscheme = "nightfly";
}
