{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  gtk3,
  libsoup_3,
  webkitgtk_4_1
}:
rustPlatform.buildRustPackage rec {
  pname = "arnis";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "louis-e";
    repo = "arnis";
    rev = "v${version}";
    hash = "sha256-u5R1b+S99UOeGKudecQF92lIcbm+8aGD1ZlNtd3gmb0=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-x5TwaJ6DWHM/HGVsto74q9w4he2xiUHxWAuJCMwx7QI=";

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    openssl
    gtk3
    libsoup_3
    webkitgtk_4_1
  ];
  meta = with lib; {
    description = "Rust-powered cli for bsac college timetable";
    homepage = "https://github.com/louis-e/arnis";
    license = licenses.gpl3;
    maintainers = with maintainers; [
      louis-e
    ];
  };
}
