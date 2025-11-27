{
  perSystem = {pkgs, ...}: let
    wg-netns = pkgs.python3Packages.buildPythonApplication {
      name = "wg-netns";
      version = "2.3.5";
      pyproject = true;

      nativeBuildInputs = [pkgs.python3Packages.poetry-core];

      dependencies = with pkgs.python3Packages; [pyyaml];

      src = ../.;

      meta.mainProgram = "wg-netns";
    };
  in {
    packages = {
      inherit wg-netns;
      default = wg-netns;
    };
  };
}
