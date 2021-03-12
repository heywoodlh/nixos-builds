{ config, pkgs, ... }:

{

  # Allow non-free applications to be installed
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     vim fish git gnupg firefox qutebrowser kitty python38 nodejs yarn rofi jq starship bitwarden-cli keyutils pass xclip syncthing albert bitwarden gnome3.gnome-tweak-tool gnome3.dconf-editor wireguard-tools busybox unzip go mosh bind weechat gcc gnumake chrome-gnome-shell ansible python38Packages.binwalk python38Packages.setuptools file patchelf nix-index autoPatchelfHook _1password-gui wavebox python38Packages.pip maim sxhkd desktop-file-utils libnotify neofetch hydroxide youtube-dl gnomeExtensions.dash-to-dock qemu-utils keynav xdotool home-manager peru veracrypt pinentry-curses
  ];

  
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Display server applications
  services.xserver = {
    enable = true;
    layout = "us";
    libinput = {
      enable = true;
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome3 = {
      enable = true;
      extraGSettingsOverridePackages = with pkgs; [ gnome3.gnome-settings-daemon ];
      extraGSettingsOverrides = ''
      [org.gnome.settings-daemon.plugins.media-keys]
      custom-keybindings=[
        '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/'
	'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/'
	'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/'
	'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/'
      ]


      [org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0]
      binding='<Ctrl><Alt>t'
      command='kitty'
      name='Open terminal'

      [org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1]
      binding='<Ctrl><Super>s'
      command='/home/heywoodlh/.local/bin/bwmenu'
      name='Bitwarden Menu'

      [org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2]
      binding='<Super><Shift>s'
      command='/home/heywoodlh/.local/bin/scripts/screenshot'
      name='Screenshot'
      
      [org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom3]
      binding='<Super><Space>'
      command='albert show'
      name='Albert Launcher'
    '';
    };
  };

  programs.fish.enable = true;

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
    anbox = {
      enable = true;
    };
  };
  
  services = {
    unclutter = {
      enable = true;
      timeout = 10;
    };
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = false;
        server_names = [ "cloudflare" ];

        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
      };
    };
  };

  programs.adb.enable = true;  

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy2";
  };

  users.users.heywoodlh = {
      isNormalUser = true;
      uid = 1000;
      home = "/home/heywoodlh";
      description = "Spencer Heywood";
      extraGroups = [ "wheel" "networkmanager" "adbusers" ];
      shell = pkgs.fish;
  };

  nix.allowedUsers = [ "heywoodlh" ];

  services = {
    syncthing = {
      enable = true;
      user = "heywoodlh";
      dataDir = "/home/heywoodlh/Sync";
      configDir = "/home/heywoodlh/.config/syncthing";
    };
  };
}
