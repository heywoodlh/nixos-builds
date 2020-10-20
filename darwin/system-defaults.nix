{ config, pkgs, ...}:

{
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults = {
     dock = {
       autohide = true;
       orientation = "bottom";
       showhidden = true;
       mineffect = "genie";
       launchanim = true;
       show-process-indicators = true;
       tilesize = 48;
       static-only = true;
       mru-spaces = false;
     };
     finder = {
       AppleShowAllExtensions = true;
       FXEnableExtensionChangeWarning = false;
       CreateDesktop = false; # disable desktop icons
     };
     trackpad = {
       Clicking = true;
       TrackpadThreeFingerDrag = true;
     };
     # Apple firewall config:
     alf = {
       globalstate = 2; # 2 = block all, 1 = enabled, 0 = disabled
       loggingenabled = 0; # disabled
       stealthenabled = 1;
     };
     loginwindow.GuestEnabled = false;
     SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
     NSGlobalDomain = {
       AppleInterfaceStyle = "Dark"; # set dark mode
       AppleKeyboardUIMode = 3;
       ApplePressAndHoldEnabled = false;
       NSAutomaticCapitalizationEnabled = false;
       NSAutomaticDashSubstitutionEnabled = false;
       NSAutomaticPeriodSubstitutionEnabled = false;
       NSAutomaticQuoteSubstitutionEnabled = false;
       NSAutomaticSpellingCorrectionEnabled = false;
       NSNavPanelExpandedStateForSaveMode = true;
       NSNavPanelExpandedStateForSaveMode2 = true;
     };
   };
  
}
