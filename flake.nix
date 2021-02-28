{

  description = "A flake with a subflake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.subflake = { type = "path"; path = "./subflake"; };

  outputs = { self, nixpkgs, subflake }: {
    packages.x86_64-linux.hello = subflake.inputs.nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.hello2 = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

    nur = { abcde = "test"; };
  };
}
