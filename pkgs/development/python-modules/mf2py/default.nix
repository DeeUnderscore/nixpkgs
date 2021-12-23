{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, html5lib
, requests
, beautifulsoup4
, lxml
, mock
, nose
}:
buildPythonPackage rec {
  pname = "mf2py";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "microformats";
    repo = "mf2py";
    rev = version;
    sha256 = "sha256-9pAD/eCmc/l7LGmKixDhZy3hhj1jCmcyo9wbqgtz/wI=";
  };

  propagatedBuildInputs = [
    html5lib
    requests
    beautifulsoup4
  ];

  checkInputs = [
    lxml
    mock
    nose
  ];

  meta = with lib; {
    description = "A parser for microformats 2";
    homepage = "http://microformats.org/wiki/mf2py";
    license = licenses.mit;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
