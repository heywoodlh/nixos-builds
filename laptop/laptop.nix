{ config, pkgs, ... }:

{


  # Allow non-free applications to be installed
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     vim fish git gnupg firefox kitty python38 nodejs yarn rofi jq starship bitwarden-cli keyutils pass xclip syncthing albert bitwarden gnome3.gnome-tweak-tool gnome3.dconf-editor slack wireguard-tools busybox unzip signal-desktop go mosh bind weechat teams gcc gnumake chrome-gnome-shell ansible python38Packages.binwalk
  ];

  
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

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
}
