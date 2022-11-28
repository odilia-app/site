{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/6c6409e965a6.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [ hugo ];
}
