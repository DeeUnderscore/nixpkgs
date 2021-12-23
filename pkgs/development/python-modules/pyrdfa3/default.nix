{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, rdflib
, html5lib
}:
buildPythonPackage rec {
  pname = "pyrdfa3";
  version = "3.5.3";

  src = fetchPypi {
    inherit version;
    pname = "pyRdfa3";
    sha256 = "sha256-FXZjqSuH3zRbb2m94jXf9feXiRYI4S/h5PqNrWhxMa4=";
  };

  propagatedBuildInputs = [
    rdflib
    html5lib
  ];

  # tests fail with Python 3
  doCheck = false;

  meta = with lib; {
    description = "Distiller/parser library for RDFa";
    homepage = "https://github.com/RDFLib/pyrdfa3";
    license = licenses.w3c;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
