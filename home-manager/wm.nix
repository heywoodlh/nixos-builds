{ config, pkgs, ... }:

{
  services = {
    sxhkd = {
      enable = true;
      extraConfig = ''
        super + space 
          albert show

	super + shift + s
          maim -s -c "0.56,0.63,0.70,0.4" | xclip -selection clipboard -t image/png

        control + super + s
          bwmenu

        control + alt + t
          kitty
      '';
    };
  };
}
