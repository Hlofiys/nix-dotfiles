{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "bsac-cli";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "hlofiys";
    repo = "bsac-cli";
    rev = "v${version}";
    hash = "sha256-s8jl165kMkU2RAvNpzXkjm6TH6uOKGYFqETfATWaw00=";
  };

  cargoHash = "sha256-zOS3vJw+9xBqdWRwb4mzNVyjtnPIg8xjXTw+O1oaX+c=";

  meta = with lib; {
    description = "Rust-powered cli for bsac college timetable";
    homepage = "https://github.com/hlofiys/bsac-cli";
    license = licenses.gpl3;
    maintainers = with maintainers; [
      hlofiys
    ];
  };
}