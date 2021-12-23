{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, lxml
, pytestCheckHook 
}:
buildPythonPackage rec {
  pname = "html-text";
  version = "0.5.2";

  src = fetchPypi {
    inherit version;
    pname = "html_text";
    sha256 = "sha256-r9Ybu3BlHUlKjDJnCim5FASS7MyWkBCYV76uQcMJPe0=";
  };

  propagatedBuildInputs = [ lxml ];

  checkInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "Extract text from HTML";
    homepage = "https://github.com/TeamHG-Memex/html-text";
    license = licenses.mit;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
