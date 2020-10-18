{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_shell = "fish";
  user_description = "Spencer Heywood";
  user_packages = [
    "vim"
    "pass"
    "coreutils"
    "jq"
    "hydroxide"
    "gnupg"
    "pinentry"
    "pinentry-curses"
    "python3.8"
    "python38Packages.pip"
    "m-cli"
    "gcc"
    "git"
    "go"
    "neofetch"
    "starship"
    "telnet"
    "tmux"
    "tor"
    "torsocks"
    "wine"
    "winetricks"
    "wireguard-tools"
    "scdoc"
    "syncthing"
    "skhd"
    "yabai"
    "ansible"
    "ffmpeg"
    "mpv"
    "github-cli"
    "dos2unix"
    "bitwarden-cli"
    "fzf"
    "mosh"
    "pwgen-secure"
  ];
  user_brew_formulae = [
    "choose-gui"
    "dnscrypt-proxy"
  ];
  user_brew_casks = [
    "osxfuse"
    "1password"
    "bitwarden"
    "blockblock"
    "caffeine"
    "do-not-disturb"
    "docker"
    "dropbox"
    "eloston-chromium"
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
  programs.gnupg.agent.enable = true;

  users.users.${user_name} = {
    description = "${user_description}";
    home = "/Users/${user_name}";
    name = "${user_full_name}";
    shell = pkgs.${user_shell};
  };
}
