{ lib
, stdenv
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, beautifulsoup4
, extruct
, requests
, pytestCheckHook }:
buildPythonPackage rec {
  pname = "recipe-scrapers";
  version = "13.10.0";
  disable = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "hhursev";
    repo = "recipe-scrapers";
    rev = version;
    sha256 = "sha256-7hvHoahAA0L4/9WD/kti7FWIbGLuECF8BJxT3jelTGI=";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    extruct
    requests
  ];

  checkInputs = [
    pytestCheckHook
  ];

  pytestFlagsArray = [ "--ignore=templates/" ];

  meta = with lib; {
    description = "Scraping tool for recipe websites";
    homepage = "https://github.com/hhursev/recipe-scrapers";
    license = licenses.mit;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
