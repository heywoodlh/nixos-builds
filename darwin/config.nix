{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_shell = "fish";
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
    pkgs.python38
    pkgs.python38Packages.pip
    pkgs.m-cli
    pkgs.gcc
    pkgs.git
    pkgs.go
    pkgs.neofetch
    pkgs.starship
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
  ];
  user_brew_formulae = [
    "choose-gui"
    "dnscrypt-proxy"
    "mas"
  ];
  user_brew_casks = [
    "osxfuse"
    "altserver"
    "1password"
    "bitwarden"
    "blockblock"
    "caffeine"
    "do-not-disturb"
    "docker"
    "dropbox"
    "eloston-chromium"
    "ferdi"
    "firefox"
    "firefox-developer-edition"
    "iterm2"
    "kitty"
    "knockknock"
    "netiquette"
    "oversight"
    "plex"
    "pock"
    "ransomwhere"
    "reikey"
    "rocket-chat"
    "secretive"
    "signal"
    "slack"
    "syncthing"
    "tor-browser"
    "tunnelblick"
    "veracrypt"
    "vmware-fusion"
    "vnc-viewer"
    "whatsyoursign"
    "yubico-yubikey-manager"
    "yubico-yubikey-personalization-gui"
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
  
  programs.${user_shell}.enable = true;

  users.users.${user_name} = {
    description = "${user_description}";
    home = "/Users/${user_name}";
    name = "${user_full_name}";
    shell = pkgs.${user_shell};
    packages = user_packages;
  };
}
