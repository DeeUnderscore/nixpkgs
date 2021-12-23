{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, lxml
, rdflib
, pyrdfa3
, mf2py
, w3lib
, html-text
, six
, jstyleson
, requests
, pytestCheckHook
, mock
}:
buildPythonPackage rec {
  pname = "extruct";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "scrapinghub";
    repo = "extruct";
    rev = "v${version}";
    sha256 = "sha256-hf6b/tZLggHzgFmZ6aldZIBd17Ni7vCTIIzhNlyjvxw=";
  };

  # Versions of rdflib >=6.0.1 include rdflib-jsonld, and the separate package
  # is not required, so we drop that requirement
  # See https://github.com/scrapinghub/extruct/pull/188
  postPatch = ''
    substituteInPlace setup.py \
      --replace "'rdflib-jsonld'," ""
  '';

  propagatedBuildInputs = [
    lxml
    rdflib
    pyrdfa3
    mf2py
    w3lib
    html-text
    six
    jstyleson
    requests
  ];

  checkInputs = [
    pytestCheckHook
    mock
  ];

  meta = with lib; {
    description = "A library for extracting embedded metadata from HTML markup";
    homepage = "https://github.com/scrapinghub/extruct";
    license = licenses.bsd3;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
