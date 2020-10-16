### My nix-darwin config


Setup:

1. [Install nix-darwin](https://github.com/LnL7/nix-darwin#install)

2. Remove the default `~/.nixpkgs` and replace with this repo:

```bash
rm -rf ~/.nixpkgs
mkdir -p ~/opt &&\
	git clone https://github.com/heywoodlh/nixos-builds ~/opt/nixos-builds
	ln -s ~/opt/nixos-builds/darwin ~/.nixpkgs
```

3. Install:

```bash
darwin-rebuild switch -I "darwin-config=$HOME/opt/nixos-builds/darwin/darwin-configuration.nix"
```
