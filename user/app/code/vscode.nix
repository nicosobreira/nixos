{ pkgs, ... }:

let
  default = "default";
in
{
  programs.vscode = {
    enable = true;
    programs.vscode.mutableExtensionsDir = true;
  };

  programs.vscode.profiles.${default} = {
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-vscode-remote.remote-containers
    ];
  };
}
