{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "sleepyfox";
      hosts = [
        {
          hostname = "acer-laptop";
          stateVersion = "25.05";
          homePath = ./home-manager/generic/home.nix;
          homeStateVersion = "25.05";
        }
        {
          hostname = "dell-laptop";
          stateVersion = "25.05";
          homePath = ./home-manager/dell-laptop/home.nix;
          homeStateVersion = "25.05";
        }
        {
          hostname = "the-fridge";
          stateVersion = "24.11";
          homePath = ./home-manager/generic/home.nix;
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
