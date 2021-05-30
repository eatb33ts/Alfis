#{ pkgs ? import <nixpkgs> {} }: # poly1305 v0.7.0 (cargo) fails to compile this way
{ ... }:
let
  pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/a58a0b5098f0c2a389ee70eb69422a052982d990.tar.gz")) {};
in
  let
    stdenv = pkgs.stdenv;
    fetchFromGitHub = pkgs.fetchFromGitHub;
    rustPlatform = pkgs.rustPlatform;
  in
rustPlatform.buildRustPackage rec {
  pname = "Alfis";
  version = "v0.6.0";
 
  buildInputs = [
    pkgs.glib
    #pkgs.cairo
    #pkgs.pango
    #pkgs.gdk-pixbuf
    #pkgs.atk
    pkgs.gtk3
    pkgs.libsoup
    pkgs.webkitgtk
    pkgs.kdialog
  ];
  nativeBuildInputs = [ pkgs.pkg-config ]; #pkgs.webkitgtk pkgs.pkg-config pkgs.kdialog pkgs.cairo pkgs.glibc ];

  doCheck = false;
  #cargoTestFlags = 

  src = fetchFromGitHub {
    owner = "Revertron";
    repo = pname;
    rev = version;
    sha256 = "1gdjrqsphb36f0s5j2grkhd0rfgmc76wwsbd0flq124c6kkx0cjs";
  };

  cargoSha256 = "0xjcfa3nc87csav55bkk4gl40g7c2b6vxf8z3arn6w48lg3v72r6";

  meta = with stdenv.lib; {
    description = "Alternative Free Identity System";
    homepage = "https://github.com/Revertron/Alfis";
    license = licenses.agpl3;
    #maintainers = [ maintainers.tailhook ];
  };
}
