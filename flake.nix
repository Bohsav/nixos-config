{
  description = "My system configuration";
  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    niri-flake.url = "github:sodiboo/niri-flake";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      niri-flake,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "sleepyfox";
      hosts = [
        {
          hostname = "dell-laptop";
          stateVersion = "25.05";
          homePath = ./home-manager/dell-laptop/home.nix;
          homeStateVersion = "25.05";
        }
        {
          hostname = "the-fridge";
          stateVersion = "24.11";
          homePath = ./home-manager/the-fridge/home.nix;
          homeStateVersion = "25.05";
        }
      ];

      makeSystem =
        {
          hostname,
          stateVersion,
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              stateVersion
              hostname
              user
              ;
          };

          modules = [
            ./nixos/${hostname}-configuration.nix
            niri-flake.nixosModules.niri
          ];
        };

      makeHome =
        {
          hostname,
          homeStateVersion,
          homePath,
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          extraSpecialArgs = {
            inherit
              inputs
              homeStateVersion
              user
              hostname
              ;
          };

          modules = [
            homePath
            stylix.homeModules.stylix
            nixvim.homeModules.nixvim
            niri-flake.homeModules.niri
          ];
        };

    in
    {
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname stateVersion;
          };
        }
      ) { } hosts;

      homeConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${user}@${host.hostname}" = makeHome {
            inherit (host) hostname homeStateVersion homePath;
          };
        }
      ) { } hosts;
    };

}
