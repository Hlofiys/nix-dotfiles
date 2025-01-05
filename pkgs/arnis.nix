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
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "louis-e";
    repo = "arnis";
    rev = "v${version}";
    hash = "sha256-NmQw08EtoWzHODgxnXJ91g9ilTEPMLJ8GrudhJusRkI=";
  };

  cargoHash = "sha256-aAHgwIbiQ3wPAtXMF93JYkz4TpuxLyq4XMTiy+SI6Hw=";

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
