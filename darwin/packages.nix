{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_description = "Spencer Heywood";
  user_packages = [
    pkgs.ansible
    pkgs.buku
    pkgs.bitwarden-cli
    pkgs.coreutils
    pkgs.dos2unix
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.github-cli
    pkgs.glow
    pkgs.gnupg
    pkgs.go
    pkgs.htop
    pkgs.hydroxide
    pkgs.jq
    pkgs.m-cli
    pkgs.mosh
    pkgs.mpv
    pkgs.neofetch
    pkgs.nodejs
    pkgs.openssh
    pkgs.pass
    pkgs.pinentry
    pkgs.pinentry-curses
    pkgs.pwgen
    pkgs.pwgen-secure
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.scdoc
    pkgs.screen
    pkgs.skhd
    pkgs.syncthing
    pkgs.tcpdump
    pkgs.telnet
    pkgs.tmux
    pkgs.todo-txt-cli
    pkgs.tor
    pkgs.torsocks
    pkgs.tree
    pkgs.vim
    pkgs.weechat
    pkgs.wireguard-tools
    pkgs.yabai
  ];
  user_brew_formulae = [
    "choose-gui"
    "dnscrypt-proxy"
    "librtlsdr"
    "mas"
  ];
  user_brew_taps = [
    "homebrew/cask"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/core"
    "homebrew/services"
  ];
  user_brew_casks = [
    "osxfuse"
    "android-platform-tools"
    "1password"
    "balenaetcher"
    "bitwarden"
    "blockblock"
    "caffeine"
    "do-not-disturb"
    "element"
    "firefox"
    "hiddenbar"
    "kitty"
    "knockknock"
    "lulu"
    "netiquette"
    "oversight"
    "plex"
    "pock"
    "qutebrowser"
    "ransomwhere"
    "reikey"
    "secretive"
    "signal"
    "slack"
    "syncthing"
    "tor-browser"
    "veracrypt"
    "vnc-viewer"
    "whatsyoursign"
  ];
  user_mas_apps = {
    DaisyDisk = 411643860;
    "WiFi Explorer" = 494803304;
  };
in {
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    brews = user_brew_formulae;
    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';
    taps = user_brew_taps;
    casks = user_brew_casks;
    masApps = user_mas_apps;
  };
 
  users.users.${user_name} = {
    description = "${user_description}";
    home = "/Users/${user_name}";
    name = "${user_full_name}";
    packages = user_packages;
  };
}
