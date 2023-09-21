{ 
description = "Flake to manage my scala workspace.";

inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

outputs = inputs: 
let
  system = "aarch64-darwin";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in { 
  devShell.${system} = pkgs.mkShell rec {
    name = "scala-shell";
    buildInputs = with pkgs; [ 
      graalvm17-ce 
      ammonite
      coursier
      jdk
      sbt
      scalafmt
      scala-cli
      bloop
    ];
    
    shellHook = ''
      export JAVA_HOME=${pkgs.graalvm17-ce}
      PATH="${pkgs.graalvm17-ce}/bin:$PATH"
    '';
  };
 };
}
