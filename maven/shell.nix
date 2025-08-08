#shell.nix
# In neovim, use :%s/my-app/<new-app-name> to change the name of the App
with import <nixpkgs> {}; 

pkgs.mkShell {
	name = "java-shell";

	packages = with pkgs; [
    maven 
  ];

	shellHook = ''
    if [ ! -d "my-app" ]; then
      mvn archetype:generate \
        -DgroupId=fr.lru \
        -DartifactId=my-app \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DinteractiveMode=false
    fi

    if [ ! -d ".nix-bin" ]; then
      mkdir -p .nix-bin
      echo 'mvn clean compile exec:java -Dexec.mainClass="fr.lru.App"' >> .nix-bin/Run
      chmod +x .nix-bin/Run
      echo 'mvn clean compile test' >> .nix-bin/Test
      chmod +x .nix-bin/Test
    fi
    export PATH=$PWD/.nix-bin:$PATH

    cd my-app
	'';
}
