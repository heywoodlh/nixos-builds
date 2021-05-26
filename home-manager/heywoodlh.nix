{ config, pkgs, ... }:

let
  username = "heywoodlh";
  homedir = "/home/${username}";
  user_packages = [
    pkgs.ansible
    pkgs.bitwarden
    pkgs.bitwarden-cli
    pkgs.buku
    pkgs.coreutils
    pkgs.discord
    pkgs.dos2unix
    pkgs.ffmpeg
    pkgs.firefox
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.github-cli
    pkgs.gnomeExtensions.caffeine
    pkgs.gnupg
    pkgs.go
    pkgs.htop
    pkgs.iosevka
    pkgs.jq
    pkgs.maim
    pkgs.mesa
    pkgs.mosh
    pkgs.neofetch
    pkgs.openssh
    pkgs.pass
    pkgs.pinentry
    pkgs.pinentry-curses
    pkgs.pwgen
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.rofi
    pkgs.scdoc
    pkgs.screen
    pkgs.signal-desktop
    pkgs.syncthing
    pkgs.tcpdump
    pkgs.telnet
    pkgs.terminator
    pkgs.tmux
    pkgs.todo-txt-cli
    pkgs.tor
    pkgs.torsocks
    pkgs.veracrypt
    pkgs.vim
    pkgs.wireguard
    pkgs.xclip
  ];
in {
  home.username = "${username}";
  home.homeDirectory = "${homedir}";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages install
  home.packages = user_packages;
}
