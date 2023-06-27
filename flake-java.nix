{ 
description = "Flake to manage my Java workspace.";

inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

outputs = inputs: 
let
  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in { 
  devShell.${system} = pkgs.mkShell rec {
    name = "java-shell";
    buildInputs = with pkgs; [ graalvm17-ce ];
    
    shellHook = ''
      export JAVA_HOME=${pkgs.graalvm17-ce}
      PATH="${pkgs.graalvm17-ce}/bin:$PATH"
    '';
  };
 };
}
