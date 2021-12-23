{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
}:
buildPythonPackage rec {
  pname = "jstyleson";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "linjackson78";
    repo = "jstyleson";
    rev = "544b9fdb43339cdd15dd03dc69a6d0f36dd73241";
    sha256 = "sha256-s/0DDfy+07TuUNjHPqKRT3xMMQl6spZCacB7Dweof7A=";
  };

  meta = with lib; {
    description = "Library to parse JSON with js-style comments";
    homepage = "https://github.com/linjackson78/jstyleson";
    license = licenses.mit;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
