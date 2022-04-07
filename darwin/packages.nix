{ config, pkgs, ... }:

let
  user_name = "heywoodlh";
  user_full_name = "Spencer Heywood";
  user_description = "Spencer Heywood";
  user_packages = [
    pkgs.gcc
    pkgs.git
    pkgs.gnupg
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.skhd
    pkgs.wireguard-tools
    pkgs.yabai
  ];
  user_brew_formulae = [
    "ansible"
    "aerc"
    "bash"
    "choose-gui"
    "coreutils"
    "dos2unix"
    "ffmpeg"
    "findutils"
    "fzf"
    "gcc"
    "gnupg"
    "gh"
    "git"
    "harfbuzz"
    "htop"
    "jailkit"
    "jq"
    "lima"
    "m-cli"
    "mas"
    "neofetch"
    "node"
    "mosh"
    "pass"
    "pass-otp"
    "pinentry-mac"
    "pwgen"
    "python"
    "screen"
    "syncthing"
    "tcpdump"
    "tmux"
    "tor"
    "torsocks"
    "tree"
    "vim"
    "zsh"
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
    "android-platform-tools"
    "beeper"
    "brave"
    "bitwarden"
    "blockblock"
    "caffeine"
    "cliclick"
    "curl"
    "cursorcerer"
    "do-not-disturb"
    "font-iosevka"
    "hiddenbar"
    "iterm2"
    "knockknock"
    "lulu"
    "microsoft-teams"
    "moonlight"
    "netiquette"
    "oversight"
    "plex"
    "ransomwhere"
    "ripgrep"
    "reikey"
    "screens"
    "secretive"
    "shadow"
    "slack"
    "syncthing"
    "ubersicht"
    "vnc-viewer"
    "whatsyoursign"
    "wireguard-go"
    "wireguard-tools"
    "zoom"
  ];
  user_mas_apps = {
    DaisyDisk = 411643860;
    Vimari = 1480933944;
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
