{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_description = "Spencer Heywood";
  user_packages = [
    pkgs.ansible
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
    "mas"
  ];
  user_brew_casks = [
    "osxfuse"
    "android-platform-tools"
    "1password"
    "balenaetcher"
    "bitwarden"
    "blockblock"
    "caffeine"
    "dmenu-mac"
    "do-not-disturb"
    "docker"
    "dropbox"
    "element"
    "firefox"
    "hiddenbar"
    "iterm2"
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
    "zoomus"
  ];
in {
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    formulae = user_brew_formulae;
    cask_args.appdir = "/Users/${user_name}/Applications";
    casks = user_brew_casks;
  };
 
  services.activate-system.enable = true;
  services.nix-daemon.enable = true;
  programs.nix-index.enable = true;
  
  users.users.${user_name} = {
    description = "${user_description}";
    home = "/Users/${user_name}";
    name = "${user_full_name}";
    packages = user_packages;
  };
}
