{
  description = "Development environment with nickel and mask";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        {
          packages.resume = pkgs.stdenv.mkDerivation {
            name = "resume";
            src = ./.;
            nativeBuildInputs = [ pkgs.typst pkgs.tzdata ];
            buildPhase = ''
              export TZDIR="${pkgs.tzdata}/share/zoneinfo"
              BUILD_DATE=$(TZ=America/New_York date -d @${toString self.lastModified} '+%B %-d, %Y')
              typst compile --input builddate="$BUILD_DATE" resume.typ resume.pdf
            '';
            installPhase = ''
              mkdir -p $out
              cp resume.pdf $out/resume.pdf
              echo "lastModified: ${toString self.lastModified}" > $out/buildinfo
              echo "builddate: $BUILD_DATE" >> $out/buildinfo
            '';
          };

          packages.default = config.packages.resume;

          apps.default = {
            type = "app";
            program = toString (pkgs.writeShellScript "copy-resume" ''
              cat ${config.packages.resume}/buildinfo
              install -m 644 ${config.packages.resume}/resume.pdf ./resume.pdf
              echo "resume.pdf written to current directory"
            '');
          };

          # Development shell with nickel and mask
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              # Core tools
              git
              mask
              typst
            ];

            shellHook = ''
              echo "🚀 Development environment loaded!"
              echo "Available tools:"
              echo "  - nickel: Configuration language"
              echo "  - mask: Task runner"
              echo ""
              echo "Run 'mask --help' to see available tasks."
              echo "Run 'nix fmt' to format all files."
            '';
          };

          # for `nix fmt`
          formatter = treefmtEval.config.build.wrapper;

          # for `nix flake check`
          checks = {
            formatting = treefmtEval.config.build.check self;
          };
        };
    };
}
