{ lib
, buildPythonPackage
, fetchFromGitHub
, dill
, pox
, ppft
, multiprocess
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pathos";
  version = "0.2.8";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "uqfoundation";
    repo = pname;
    rev = "${pname}-${version}";
    sha256 = "sha256-71hMaG+3FbWMtGqwcDOZ8uit0DsHEoc9H2GXfX7TeoM=";
  };

  propagatedBuildInputs = [
    dill
    pox
    ppft
    multiprocess
  ];

  # Require network
  doCheck = false;

  pythonImportsCheck = [
    "pathos"
  ];

  meta = with lib; {
    description = "Parallel graph management and execution in heterogeneous computing";
    homepage = "https://pathos.readthedocs.io/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
