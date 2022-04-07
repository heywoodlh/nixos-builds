{ config, pkgs, ...}:

let
  hostname = "nix-m1";
  dnsServers = [ "10.50.50.1" ];
in {
  networking = {
    knownNetworkServices = ["Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge"];
    hostName = "${hostname}";
    computerName = "${hostname}";
    localHostName = "${hostname}";
    dns = dnsServers;
  };
}
