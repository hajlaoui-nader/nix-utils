{
  description = "Flake to manage pharma workspace.";

  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

  outputs = inputs:
    let
      system = "aarch64-darwin";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      devShell.${system} = pkgs.mkShell rec {
        name = "pharma-shell";
        buildInputs = with pkgs; [
          # database
          postgresql
          # misc
          openssl
           # Python and related packages
          python3
          python3Packages.virtualenv
          python3Packages.numpy
          python3Packages.pandas
          python3Packages.opensearch-py
        ];



        shellHook = ''
        '';
      };
    };
}
