{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_description = "Spencer Heywood";
  user_packages = [
    pkgs.vim
    pkgs.pass
    pkgs.coreutils
    pkgs.jq
    pkgs.hydroxide
    pkgs.gnupg
    pkgs.pinentry
    pkgs.pinentry-curses
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.m-cli
    pkgs.gcc
    pkgs.git
    pkgs.go
    pkgs.neofetch
    pkgs.telnet
    pkgs.tmux
    pkgs.tor
    pkgs.torsocks
    pkgs.wireguard-tools
    pkgs.scdoc
    pkgs.syncthing
    pkgs.skhd
    pkgs.yabai
    pkgs.ansible
    pkgs.ffmpeg
    pkgs.mpv
    pkgs.github-cli
    pkgs.dos2unix
    pkgs.bitwarden-cli
    pkgs.fzf
    pkgs.mosh
    pkgs.pwgen-secure
    pkgs.pwgen
    pkgs.glow
    pkgs.todo-txt-cli
    pkgs.screen
    pkgs.openssh
    pkgs.weechat
    pkgs.tcpdump
    pkgs.htop
    pkgs.nodejs
    pkgs.tree
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
