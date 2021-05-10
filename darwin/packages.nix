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
    "bash"
    "choose-gui"
    "dnscrypt-proxy"
    "esolitos/ipa/sshpass"
    "fish"
    "harfbuzz"
    "jailkit"
    "lcms2"
    "librtlsdr"
    "mas"
    "mosh"
    "nativefier"
    "screen"
    "tmux"
    "tor"
    "urh"
  ];
  user_brew_taps = [
    "homebrew/cask"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/core"
    "homebrew/services"
    "browsh-org/homebrew-browsh"
  ];
  user_brew_casks = [
    "adobe-acrobat-pro"
    "android-platform-tools"
    "1password"
    "balenaetcher"
    "bitwarden"
    "blockblock"
    "caffeine"
    "cursorcerer"
    "discord"
    "do-not-disturb"
    "element"
    "firefox"
    "font-iosevka"
    "hiddenbar"
    "imazing"
    "iterm2"
    "knockknock"
    "lulu"
    "microsoft-teams"
    "netiquette"
    "osxfuse"
    "oversight"
    "plex"
    "pock"
    "qutebrowser"
    "ransomwhere"
    "reikey"
    "screens"
    "secretive"
    "shadow"
    "signal"
    "slack"
    "steam"
    "syncthing"
    "tor-browser"
    "utm"
    "veracrypt"
    "vnc-viewer"
    "webex-meetings"
    "whatsyoursign"
    "zoom"
  ];
  user_mas_apps = {
    DaisyDisk = 411643860;
    "WiFi Explorer" = 494803304;
    WireGuard = 1451685025;
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
