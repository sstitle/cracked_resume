{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "resume";
  version = "1.0.0";
  
  src = pkgs.lib.cleanSourceWith {
    src = ./.;
    filter = path: type:
      let
        baseName = baseNameOf path;
      in
        baseName != ".git" &&
        baseName != "flake.nix" &&
        baseName != "flake.lock" &&
        baseName != "treefmt.nix" &&
        baseName != "maskfile.md" &&
        baseName != "README.md" &&
        baseName != "resume.log" &&
        baseName != "resume.pdf" &&
        baseName != ".gitignore";
  };
  
  nativeBuildInputs = with pkgs; [ typst ];
  
  buildPhase = ''
    export SOURCE_DATE_EPOCH=$(date +%s)
    typst compile resume.typ resume.pdf
  '';
  
  installPhase = ''
    mkdir -p $out
    cp resume.pdf $out/resume.pdf
  '';
}
