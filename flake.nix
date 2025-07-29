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
      inputs.nixpkgs.follows = "nixpkgs";
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
      homeStateVersion = "25.05";
      homePath = ./home-manager/home.nix;
      hosts = [
        {
          hostname = "acer-laptop";
          stateVersion = "25.05";
        }
        {
          hostname = "dell-laptop";
          stateVersion = "25.05";
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
            ./nixos/configuration.nix
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

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};

        extraSpecialArgs = { inherit inputs homeStateVersion user; };

        modules = [
          homePath
          stylix.homeModules.stylix
          nixvim.homeModules.nixvim
        ];
      };
    };
}
