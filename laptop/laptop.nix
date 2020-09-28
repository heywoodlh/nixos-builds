{ config, pkgs, ... }:

{

  # Allow non-free applications to be installed
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     vim fish git gnupg firefox kitty python38 nodejs yarn rofi jq starship bitwarden-cli keyutils pass xclip syncthing albert bitwarden gnome3.gnome-tweak-tool gnome3.dconf-editor slack wireguard-tools busybox unzip signal-desktop go mosh bind weechat teams gcc gnumake chrome-gnome-shell ansible python38Packages.binwalk file patchelf nix-index autoPatchelfHook _1password-gui ungoogled-chromium wavebox python38Packages.pip maim sxhkd desktop-file-utils
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
    desktopManager.gnome3.enable = true;
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

  services = {
    syncthing = {
      enable = true;
      user = "heywoodlh";
      dataDir = "/home/heywoodlh/Sync";
      configDir = "/home/heywoodlh/.config/syncthing";
    };
  };

  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 29 31 125 ]; events = [ "key" ]; command = "bwmenu"; }
      { keys = [ 31 42 125 ]; events = [ "key" ]; command = "screenshot"; }
      { keys = [ 57 125 ]; events = [ "key" ]; command = "albert show "; }
      { keys = [ 20 29 56 ]; events = [ "key" ]; command = "kitty"; }
    ];
  };

}
