{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell rec {

  buildInputs = [
    pkgs.cmake
    pkgs.nextpnr
    pkgs.icestorm
    pkgs.yosys
    pkgs.iverilog
    pkgs.libftdi
    pkgs.pkg-config
    pkgs.gnused
    pkgs.arachne-pnr
    pkgs.xdot
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"
    sudo docker compose up -d
  '';
}
