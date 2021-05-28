{ pkgs ? import <nixpkgs> {} }:
let
  stdenv = pkgs.stdenv;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  rustPlatform = pkgs.rustPlatform;
in
rustPlatform.buildRustPackage rec {
  pname = "Alfis";
  version = "v0.5.8b";

  src = fetchFromGitHub {
    owner = "eatb33ts";
    repo = pname;
    rev = version;
    sha256 = "1rwxj65zvjq2kh1x0g138hqdgc5hxqf5lqb1g7yxz13wgnm7lc2g";
  };

  cargoSha256 = "17ldqr3asrdcsh4l29m3b5r37r5d0b3npq1lrgjmxb6vlx6a36qh";

  meta = with stdenv.lib; {
    description = "Alternative Free Identity System";
    homepage = "https://github.com/Revertron/Alfis";
    license = licenses.agpl3;
    #maintainers = [ maintainers.tailhook ];
  };
}
